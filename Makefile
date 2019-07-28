#ELM_FLAGS = --optimize
STATIC_DIR = ./static
SRC_DIR = ./src
ELM_FLAGS =
TARGET = $(STATIC_DIR)/elm.js

target: $(TARGET)

env:
	npm install

$(TARGET): $(SRC_DIR)/Main.elm
	npm run-script elm -- make $(SRC_DIR)/Main.elm --output $(TARGET) $(ELM_FLAGS)

run:
	npm run-script electron .

clean:
	-rm $(TARGET)

reset:
	-rm $(TARGET)
	-rm -r node_modules
	-rm -r elm-stuff

