#!/usr/bin/env bash

# there is currently some weird error with roary
# this fixes it as of 2022-09-13
# https://github.com/sanger-pathogens/Roary/issues/441
# export PERL5LIB=$CONDA_PREFIX/lib/perl5/site_perl/5.22.0/
# this fixed part of it, then it failed.

# what I tried running:
# roary -v --mafft -p 8 out_data/gffs/*.gff

# I had to use docker in the end
# docker pull quay.io/biocontainers/roary:3.13.0--pl526h516909a_0
docker run -it \
    --platform linux/amd64 \
    -v ../E_coli_core_genome:/data \
    --name roary \
    a880920323be bash

# what I ran (took many hours locally): roary -e --mafft -p 8 out_data/gffs/*.gff