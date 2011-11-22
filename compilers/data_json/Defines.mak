DATA_JSON_LIB_PBCS = runtime/parrot/languages/data_json/data_json.pbc

JSON_LANG = runtime/parrot/languages/JSON/JSON.pir

DATA_JSON_CLEANUPS = $(DATA_JSON_LIB_PBCS) \
    compilers/data_json/data_json.pbc \
    compilers/data_json/data_json/grammar.pir \
    compilers/data_json/data_json/pge2pir.pir
