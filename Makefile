all: specs cukes

specs:
	bin/rspec spec

cukes:
	bin/cucumber features
