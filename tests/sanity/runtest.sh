#!/bin/bash
# Include Beaker environment
. /usr/share/beakerlib/beakerlib.sh || exit 1

PACKAGE="libvarlink"

rlJournalStart
    rlPhaseStartSetup
        rlAssertRpm $PACKAGE
        rlRun "git clone https://github.com/varlink/libvarlink; cd libvarlink; meson build;make"
    rlPhaseEnd

    rlPhaseStartTest
        rlLog "Starting tests ..."
        rlRun "cd build; ninja test"
    rlPhaseEnd

    rlPhaseStartCleanup
       rlLog "libvarlink tests done"
       rlRun "rm -rf libvarlink"
    rlPhaseEnd
rlJournalPrintText
rlJournalEnd

rlGetTestState
