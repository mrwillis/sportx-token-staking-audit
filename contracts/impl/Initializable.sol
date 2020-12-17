// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.7.5;

contract Initializable {
    bool public initialized;

    /// @notice Throws if this contract has already been initialized.
    modifier notInitialized() {
        require(!initialized, "ALREADY_INITIALIZED");
        _;
    }
}
