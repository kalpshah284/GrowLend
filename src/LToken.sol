// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "../lib/openzeppelin-contracts/contracts/token/ERC20/extensions/ERC4626.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
contract strategy is ERC4626  {
    IERC20 immutable asset_;
    
    

    constructor(IERC20 _asset) ERC4626(_asset) ERC20("LToken", "LT") {
       asset_ = _asset;
    }
    function deposit(uint256 assets, address receiver) public virtual override  returns (uint256) {
        return super.deposit(assets, receiver);
    }
    function mint(uint256 shares, address receiver) public override  returns (uint256) {
        return super.mint(shares, receiver);
    }
    function redeem(uint256 shares, address receiver, address owner) public virtual override returns (uint256) {
        uint256 maxShares = maxRedeem(owner);
        if (shares > maxShares) {
            revert ERC4626ExceededMaxRedeem(owner, shares, maxShares);
        }

        uint256 assets = previewRedeem(shares);
        _withdraw(_msgSender(), receiver, owner, assets, shares);

        return assets;
    }
    function withdraw(uint256 assets, address receiver, address owner) public virtual override returns (uint256) {
        uint256 maxAssets = maxWithdraw(owner);
        if (assets > maxAssets) {
            revert ERC4626ExceededMaxWithdraw(owner, assets, maxAssets);
        }

        uint256 shares = previewWithdraw(assets);
        _withdraw(_msgSender(), receiver, owner, assets, shares);

        return shares;
    }
    function _decimalsOffset() internal view virtual override returns (uint8) {
        return 3;
    }
    
}   