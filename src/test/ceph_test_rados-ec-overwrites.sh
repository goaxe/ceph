#!/bin/bash
#
# Copyright (C) 2014, 2015 Red Hat <contact@redhat.com>
# Copyright (C) 2013 Cloudwatt <libre.licensing@cloudwatt.com>
#
# Author: Loic Dachary <loic@dachary.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Library Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Library Public License for more details.
#
source $(dirname $0)/detect-build-env-vars.sh

CEPH_CLI_TEST_DUP_COMMAND=1 \
EC_OVERWRITES=1 MON=1 OSD=5 CEPH_START='mon osd' CEPH_PORT=7401 $CEPH_ROOT/src/test/vstart_wrapper.sh \
    $CEPH_BIN/ceph_test_rados --pool ec --no-omap --no-sparse --max-in-flight 7 --op write 50 --op write_excl 0 --op append_excl 0 --op append 50 --objects 15 --op read 100 --op snap_create 10 --op snap_remove 10 --op rollback 10 --op delete 50 --op copy_from 50 --max-ops 1000
