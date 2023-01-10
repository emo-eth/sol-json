// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { SSTORE2 } from "solmate/utils/SSTORE2.sol";
import { ERC721 } from "./lib/ERC721.sol";
import { Ownable2Step } from "openzeppelin-contracts/access/Ownable2Step.sol";

contract Prose is ERC721, Ownable2Step {
    mapping(uint256 => address[]) tokenTexts;
    mapping(uint256 => address[]) tokenRenderers;
    address public defaultTokenRenderer;

    struct TokenVersion {
        uint16 textVersion;
        uint16 rendererVersion;
    }

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) { }

    function tokenURI(uint256) public pure override returns (string memory) {
        return "";
    }

    function versionedTokenURI(
        uint256 tokenId,
        uint256 textVersion,
        uint256 rendererVersion
    )
        public
        view
        returns (string memory)
    {
        return "";
    }

    function mint(address to, uint256 tokenId, string calldata text) external onlyOwner {
        _mint(to, tokenId);
        address copy = SSTORE2.write(bytes(text));
        tokenTexts[tokenId].push(copy);
    }
}
