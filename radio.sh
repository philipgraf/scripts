#!/bin/bash

set -e
cd $HOME/.radios
select radio in *; do
        cvlc $(cat $radio)
done
