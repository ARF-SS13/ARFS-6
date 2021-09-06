#!/bin/bash
# Generate maps
map_files=(
    "./maps/Arfs/arfs-1-deckone.dmm"
    "./maps/Arfs/arfs-2-decktwo.dmm"
    "./maps/Arfs/arfs-3-deckthree.dmm"
    "./maps/Arfs/arfs-4-centcom.dmm"
    "./maps/Arfs/arfs-5-space.dmm"
    "./maps/Arfs/arfs-6-asteroid.dmm"
    "./maps/Arfs/arfs-7-mining.dmm"
    "./maps/Arfs/arfs-8-underdark.dmm"
    "./maps/Arfs/residential/residential_station.dmm"
    "./maps/Arfs/residential/residential_arf.dmm"
    "./maps/Arfs/residential/residential_arf_two.dmm"
    "./maps/Arfs/residential/residential_arf_mansion.dmm"
#   "./maps/tether/tether-09-solars.dmm"
#   "./maps/offmap_vr/talon/talon1.dmm"
#   "./maps/offmap_vr/talon/talon2.dmm"
)

tools/github-actions/nanomap-renderer minimap -w 2240 -h 2240 "${map_files[@]}"

# Move and rename files so the game understands them
cd "data/nanomaps"

# mv "talon1_nanomap_z1.png" "tether_nanomap_z13.png"
# mv "talon2_nanomap_z1.png" "tether_nanomap_z14.png"
# mv "tether-01-surface1_nanomap_z1.png" "tether_nanomap_z1.png"
# mv "tether-02-surface2_nanomap_z1.png" "tether_nanomap_z2.png"
# mv "tether-03-surface3_nanomap_z1.png" "tether_nanomap_z3.png"
# mv "tether-04-transit_nanomap_z1.png" "tether_nanomap_z4.png"
# mv "tether-05-station1_nanomap_z1.png" "tether_nanomap_z5.png"
# mv "tether-06-station2_nanomap_z1.png" "tether_nanomap_z6.png"
# mv "tether-07-station3_nanomap_z1.png" "tether_nanomap_z7.png"
# mv "tether-08-mining_nanomap_z1.png" "tether_nanomap_z8.png"
# mv "tether-09-solars_nanomap_z1.png" "tether_nanomap_z9.png"

mv "arfs-1-deckone_nanomap_z1.png" "arfs_nanomap_z1.png"
mv "arfs-2-decktwo_nanomap_z1.png" "arfs_nanomap_z2.png"
mv "arfs-3-deckthree_nanomap_z1.png" "arfs_nanomap_z3.png"
mv "arfs-4-centcom_nanomap_z1.png" "arfs_nanomap_z4.png"
mv "arfs-5-space_nanomap_z1.png" "arfs_nanomap_z5.png"
mv "arfs-6-asteroid_nanomap_z1.png" "arfs_nanomap_z6.png"
mv "arfs-7-mining_nanomap_z1.png" "arfs_nanomap_z7.png"
mv "arfs-8-underdark_nanomap_z1.png" "arfs_nanomap_z8.png"
mv "residential_arf_nanomap_z1.png" "arfs_nanomap_z9.png"


cd "../../"
cp data/nanomaps/* "icons/_nanomaps/"