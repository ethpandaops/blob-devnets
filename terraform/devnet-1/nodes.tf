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
  type        = any
  description = "List of node definitions for the devnet"
  default = [
    { name = "bootnode", count = 1, cloud = "hetzner" },
    { name = "mev-relay", count = 1, cloud = "hetzner", size = "cx53", supernode = true },
    { name = "lighthouse-geth-super", count = 2, cloud = "hetzner", validator_start = 0, validator_end = 8 },
    { name = "lighthouse-besu-super", count = 2, cloud = "hetzner", validator_start = 8, validator_end = 16 },
    { name = "prysm-nethermind-super", count = 2, cloud = "hetzner", validator_start = 16, validator_end = 24 },
    { name = "prysm-reth-super", count = 2, cloud = "hetzner", validator_start = 24, validator_end = 32 },
    { name = "lighthouse-erigon-full", count = 2, cloud = "hetzner", validator_start = 32, validator_end = 40 },
    { name = "lighthouse-nimbusel-full", count = 2, cloud = "hetzner", validator_start = 40, validator_end = 48 },
    { name = "prysm-geth-full", count = 2, cloud = "hetzner", validator_start = 48, validator_end = 56 },
    { name = "prysm-besu-full", count = 2, cloud = "hetzner", validator_start = 56, validator_end = 64 },
    { name = "teku-geth-super", count = 2, cloud = "hetzner", validator_start = 64, validator_end = 72 },
  ]
}
