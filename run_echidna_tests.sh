#!/bin/sh
echidna test/EchidnaTest.t.sol --contract EchidnaTest --config echidna.config.yaml
echidna test/EchidnaTestRaces.t.sol --contract EchidnaTestRaces --config echidna_races.config.yaml
