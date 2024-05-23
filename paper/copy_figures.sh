#!/bin/bash

# Copy style file and orcid graphic as they are always needed.
cp arxiv.sty ax
cp orcid.pdf ax
# Only copy the graphics used in the paper part of your thesis to ax.
# You don't want to upload unused graphics to arxiv!
for i in $(grep -roh -E "Graphics/\w*" PaperContents);
do
	find ./Graphics -name $(echo $i | cut -d "/" -f 2).\* -exec cp -v {} ax \;
done;
