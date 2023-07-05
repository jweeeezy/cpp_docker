#include <iostream>

int	main(int argc, char const **argv)
{
	if (argc < 0)
	{
		std::cout << "negative arguments!" << std::endl;
	}
	if (argv == NULL)
	{
		std::cout << "no arguments" << std::endl;
	}
	std::cout << "Hello World!" << std::endl;
	return (0);
}
