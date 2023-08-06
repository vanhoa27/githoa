NAME		:= PROJECT_NAME
OBJFILES	:= build/PROJECT_NAME.o 
CFLAGS		:= -Wall -Werror -g 
CC			:= clang

build/$(NAME): $(OBJFILES)
	$(CC) $(CFLAGS) -o $@ $^

build/%.o: src/%.c
	$(CC) $(CFLAGS) -c -o $@ $^

run: build/$(NAME)
	@./build/$(NAME)

clean:
	rm -f build/* 

pack:
	zip -r submission.zip src/
