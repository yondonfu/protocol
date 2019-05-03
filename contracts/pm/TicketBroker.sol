pragma solidity ^0.4.25;
// solium-disable-next-line
pragma experimental ABIEncoderV2;

import "./mixins/MixinContractRegistry.sol";
import "./mixins/MixinReserve.sol";
import "./mixins/MixinTicketBrokerCore.sol";
import "./mixins/MixinTicketProcessor.sol";


contract TicketBroker is
    MixinContractRegistry,
    MixinReserve,
    MixinTicketBrokerCore,
    MixinTicketProcessor
{
    constructor(
        address _controller,
        uint256 _freezePeriod,
        uint256 _unlockPeriod,
        uint256 _ticketValidityPeriod
    )
        public
        MixinContractRegistry(_controller)
        MixinReserve()
        MixinTicketBrokerCore()
        MixinTicketProcessor()
    {
        freezePeriod = _freezePeriod;
        unlockPeriod = _unlockPeriod;
        ticketValidityPeriod = _ticketValidityPeriod;
    }

    /**
     * @dev Sets freezePeriod value. Only callable by the Controller owner
     * @param _freezePeriod Value for freezePeriod
     */
    function setFreezePeriod(uint256 _freezePeriod) external onlyControllerOwner {
        freezePeriod = _freezePeriod;
    }

    /**
     * @dev Sets unlockPeriod value. Only callable by the Controller owner
     * @param _unlockPeriod Value for unlockPeriod
     */
    function setUnlockPeriod(uint256 _unlockPeriod) external onlyControllerOwner {
        unlockPeriod = _unlockPeriod;
    }

    /**
     * @dev Sets ticketValidityPeriod value. Only callable by the Controller owner
     * @param _ticketValidityPeriod Value for ticketValidityPeriod
     */
    function setTicketValidityPeriod(uint256 _ticketValidityPeriod) external onlyControllerOwner {
        ticketValidityPeriod = _ticketValidityPeriod;
    }
}