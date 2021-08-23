const NaxeloToken = artifacts.require("NaxeloToken");

module.exports = function (deployer) {
  deployer.deploy(NaxeloToken, 1000000);
};