# General Deploy Utility (GDU)

GDU is a simple, yet powerful deployment tool designed to streamline the process of deploying web applications to remote servers. With a focus on ease of use, GDU offers an automated solution to build, configure, and deploy projects with minimal hassle.

## Features

- **Easy Installation**: Set up GDU with a single command.
- **Configurable**: Customize deployment settings for each project.
- **Automated Deployment**: Deploy your projects with one command, handling tasks from building to transferring files.

## Installation

Install GDU with the following command:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/jmallett6462/GDU/main/install.sh)"
```

**Note**: Always ensure you trust scripts before executing them, especially one-liners.

## Usage

### Configuring a Project

Navigate to your project directory and run:

```bash
gdu config
```

Follow the prompts to configure the deployment settings for your project. This will create a `gdu.config` file in your project directory.

### Deploying a Project

Once configured, you can deploy your project by simply running:

```bash
gdu deploy
```

GDU will deploy your project according to the configurations set in `gdu.config`.

## Contributing

Contributions to GDU are welcome! Feel free to fork the repository and submit pull requests.

## License

This project is licensed under the [MIT License](LICENSE.md).

## Acknowledgements

Thanks to all contributors and users of GDU. Your feedback and contributions make this project better!
