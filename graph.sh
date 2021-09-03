#!/bin/bash

find ${PYAN_INPUT_DIR} -name "*.py" \
	| xargs python3 -m pyan.main --dot --colored --no-defines --grouped \
	| dot -Tpng -Granksep=1.5 -o /output/$1

