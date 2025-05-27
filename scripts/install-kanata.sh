#!/bin/bash

log "installing rustup"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

log "sourcing /env"
. "$HOME/.cargo/env"

log "updating rustup"
rustup update stable

log "installing kanata"
cargo install kanata

log "kanata installed"
