# AWSLambda

An example of running Swift programm on AWS Lambda.

## Getting Started

### Building module

If you dont't install Docker, first you should install it. This project uses Docker to build Swift code enables to run on AWS Lambda.

First, let's set up the environment for building.

```
docker build -t builder .
```

Then, launch swift build command.

```
docker run --rm -v "$(pwd)":/workspace -w /workspace builder bash -cl "swift build --product AWSLambda -c release -Xswiftc -g"
```

After that, you'll get a binary produced by Swift build. Finally, run the process to create zip file available on AWS Lambda from the binary.

```
docker run --rm -v "$(pwd)":/workspace -w /workspace builder bash -cl "./package.sh"
```

You'll get a zip file. Upload it to your own AWS Lambda function.

### Run
Open the AWS Lambda console and select `test` tab. Put the following JSON to the input form, then click the `test` button.

```
{
    "name": "<your_name>"
}
```

## Documentation
I jot some tips down to the following documentation (in Japanese).

- Swift を AWS Lambda で使うために必要だったこと: https://zenn.dev/helloyuki/scraps/9dd015c8a6adcb

Furthermore, I had a talk regarding this repository (in Japanese as well).

- [Presentation Material URL]

Enjoy running Swift code on AWS Lambda!
