# Skeleton nuxtjs docker

## Init environment from one command `make init`
* create docker base image
* mount `./src` directory
* run [create-nuxt-app](https://github.com/nuxt/create-nuxt-app)
  * choose package manager, 
  * choose ui framework
  * choose serverside framework
  * choose nuxtjs modules
  * choose linter
  * choose test framework
  * choose spa vs ssr

```
$ make init
```

## Build && Start Development

```
$ make build
$ make up
```

