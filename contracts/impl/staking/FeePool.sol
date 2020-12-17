// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.7.5;
pragma abicoder v2;

import "../../interfaces/permissions/IPermissions.sol";
import "../../interfaces/staking/IFeePool.sol";
import "../../interfaces/staking/IStaking.sol";
import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";

contract FeePool is IFeePool {
    using SafeERC20 for IERC20;

    IPermissions private permissions;
    IStaking private staking;

    constructor(IPermissions _permissions, IStaking _staking) {
        permissions = _permissions;
        staking = _staking;
    }

    /// @notice Throws if the caller is not the Staking Contract
    modifier onlyStaking() {
        require(msg.sender == address(staking), "ONLY_STAKING_CONTRACT");
        _;
    }

    function withdrawFee(
        address user,
        address baseToken,
        uint256 amount
    ) external override onlyStaking {
        IERC20(baseToken).safeTransfer(user, amount);
    }
}
