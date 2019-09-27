[![Build Status](https://travis-ci.org/ryu1kn/vscode--telemetry.svg?branch=master)](https://travis-ci.org/ryu1kn/vscode--telemetry)

# Visual Studio Code Telemetry

Receive plugin usage data to help improve plugins.

## Usage

Export `ENV_NAME` environment variable, then:

To deploy

```sh
infra/deploy.sh
```

To undeploy

```sh
infra/undeploy.sh
```

To test if the environment is ok

```sh
export API_DOMAIN=<domain name of the API>
./test.sh
```
