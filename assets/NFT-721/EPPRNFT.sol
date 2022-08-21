// EPPR - NFT 721 para OpenSea en Polygon: https://github.com/EPPR/NFT-721/
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
// https://github.com/EPPR/NFT-721/blob/main/EPPRNFT.sol (Link para importar en Remix)
// Link de Remix: https://remix.ethereum.org/
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract EPPRNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("MATI NFT", "MATI NFT 2022") {}

    event Mint(
        address indexed sender,
        address indexed owner,
        string tokenURI,
        uint256 tokenId
    );

    function mint(address owner, string memory tokenURI)
        public
        returns (uint256)
    {
        require(
            owner == msg.sender,
            "Can only mint NFT for yourself on default contract"
        );
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(owner, newItemId);
        _setTokenURI(newItemId, tokenURI);

        emit Mint(msg.sender, owner, tokenURI, newItemId);
        return newItemId;
    }

    function uri(uint256 tokenId) public view returns (string memory) {
        return tokenURI(tokenId);
    }
}