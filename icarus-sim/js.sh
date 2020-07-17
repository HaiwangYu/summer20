
js=$1

jsonnet \
--ext-code DL=0 \
--ext-code DT=0 \
--ext-code lifetime=0 \
-V epoch=after \
-V reality=data \
-V signal_output_form=sparse \
-V raw_input_label=simmer:daq \
-V tpc_volume_label='' \
-J cfg ${js}.jsonnet \
-o ${js}.json


#wirecell-pgraph dotify --jpath -1 --no-params ${js}.json ${js}.pdf
#wirecell-pgraph dotify --jpath -1 ${js}.json ${js}.pdf
