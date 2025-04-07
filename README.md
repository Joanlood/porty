# Porty - Free Port Scanner

Porty is a simple, yet powerful port scanner that helps you find free ports between a given range. It is designed to be easy to use, and it works on Linux systems with ease.

## Features
- Scans a range of ports (default: 1024 to 65535)
- Checks for free ports
- Limits the results (default: 5)
- Easy to install and use via simple shell commands

## Installation

To install **Porty** on your Linux machine, you can simply run the following command in your terminal:

`curl -fsSL https://raw.githubusercontent.com/Joanlood/porty/main/install.sh | sudo bash`

This will download and install **Porty** to `/usr/local/bin/porty` and make it executable.

## Usage

Once installed, you can start using **Porty** immediately. To check the version of **Porty**, use the following command:

`porty --version`

### Scan for Free Ports

To scan for free ports between 1024 and 65535, use the following command:

`porty`

You will be prompted to enter the starting port, ending port, maximum results, and count.

### Update Porty

To update **Porty** to the latest version, simply run:

`porty --update`

This will fetch the latest version from GitHub and install it.

### Uninstall Porty

If you ever want to uninstall **Porty**, run the following command:

`curl -fsSL https://raw.githubusercontent.com/Joanlood/porty/main/uninstall.sh -o uninstall.sh && sudo bash uninstall.sh`

## Example Output

Here's an example of the output when you run **Porty**:

Please enter the starting port (default 1024):
[User enters 2000 or hits Enter for the default]

Please enter the ending port (default 65535):
[User enters 3000 or hits Enter for the default]

Please enter the maximum number of results to display (default 5):
[User enters 3 or hits Enter for the default]

Please enter the count (default 0):
[User enters 2 or hits Enter for the default]

Using the following settings:
START_PORT = 2000
END_PORT = 3000
MAX_RESULTS = 3
COUNT = 2

✅ Port 2000 is free
✅ Port 2001 is free
✅ Port 2002 is free

## License

This project is licensed under the GPL 3.0 License - see the [LICENSE](LICENSE) file for details.

## Contributing

Feel free to fork the repository, submit pull requests, or report issues. Contributions are welcome!

## Contact

I am working on a Discord Server but feel free to Report issues at Github.

You can also follow me on GitHub: [@Joanlood](https://github.com/Joanlood).

---

Have Fun! 🚀

