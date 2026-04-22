########################################################################################
#                                    NODE DEFINITIONS
#
# Define your fleet as a list of node entries. Each entry supports:
#
#   Required:
#     - name            : Node type (e.g., "lighthouse-geth-super", "bootnode")
#     - count           : Number of instances
#     - cloud           : "digitalocean" or "hetzner"
#
#   Optional:
#     - validator_start : First validator index (default: 0)
#     - validator_end   : Last validator index (default: 0)
#     - size            : Instance size override (provider-specific)
#     - region          : Region override (digitalocean) or location (hetzner)
#     - supernode       : Force supernode=true/false (auto-detected from name)
#
# Examples:
#   { name = "bootnode", count = 1, cloud = "digitalocean" }
#   { name = "lighthouse-geth-super", count = 2, cloud = "hetzner", validator_start = 0, validator_end = 200 }
#   { name = "mev-relay", count = 1, cloud = "hetzner", size = "ccx53" }
#
########################################################################################

variable "nodes" {
  description = "List of node definitions for the devnet"
  default = [
    { name = "bootnode", count = 1, cloud = "digitalocean", region = "ams3" },

    { name = "prysm-geth", count = 22, cloud = "digitalocean", validator_start = 0, validator_end = 220,  region = "ams3" },
    { name = "prysm-geth-super", count = 3, cloud = "digitalocean", validator_start = 220, validator_end = 1600, supernode = true, region = "ams3" },
    { name = "prysm-nethermind", count = 22, cloud = "digitalocean", validator_start = 1600, validator_end = 1820, region = "blr1" },
    { name = "prysm-nethermind-super", count = 3, cloud = "digitalocean", validator_start = 1820, validator_end = 3200, supernode = true, region = "blr1" },
  ]
}
