#!/bin/bash
rm -rf channel-artifacts/*
export FABRIC_CFG_PATH=$PWD
configtxgen -outputBlock channel-artifacts/genesis.block -channelID ordererchannel -profile OrdererChannel
configtxgen -outputCreateChannelTx channel-artifacts/fabricchannel.tx -channelID fabricchannel -profile fabricchannel
configtxgen --outputAnchorPeersUpdate channel-artifacts/superadminAnchor.tx -channelID fabricchannel -profile fabricchannel -asOrg superadminMSP
configtxgen --outputAnchorPeersUpdate channel-artifacts/usersAnchor.tx -channelID fabricchannel -profile fabricchannel -asOrg usersMSP