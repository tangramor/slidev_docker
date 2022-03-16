# Slidev Docker image

Work with [Slidev](https://sli.dev/). Just run following command in your work folder:

```bash
docker run --name slidev --rm -it \
    --user node \
    -v ${PWD}:/slidev \
    -p 3030:3030 \
    tangramor/slidev:latest
```

If your work folder is empty, it will generate a template `slides.md` and other related files under your work folder, and launch the server on port `3030`. 

You can access your slides from http://localhost:3030/


## Build deployable image

Or you can create your own slidev project to a docker image with Dockerfile:

```Dockerfile
FROM tangramor/slidev:latest

ADD . /slidev

```

Create the docker image: `docker build -t myppt .`

And run the container: `docker run --name myslides --rm --user node -p 3030:3030 myppt`

You can visit your slides from http://localhost:3030/


## Build hostable SPA (Single Page Application)

Run command `docker exec -i slidev npx slidev build` on the running container `slidev`. It will generate static HTML files under `dist` folder.

### Host on Github Pages

You can host `dist` in a static web site such as [Github Pages](https://tangramor.github.io/slidev_docker/) or Gitlab Pages. 

Because in Github pages the url may contain subfolder, so you need to modify the generated `index.html` to change `href="/assets/xxx` to `href="./assets/xxx`. Or you may use `--base=/<subfolder>/` option during the build process, such as: `docker exec -i slidev npx slidev build --base=/slidev_docker/`.

And to avoid Jekyll build process, you need to add an empty file `.nojekyll`.


### Host by docker

You can also host it by yourself with docker:

```bash
docker run --name myslides --rm -p 80:80 -v ${PWD}/dist:/usr/share/nginx/html nginx:alpine
```

Or create a static image with following Dockerfile:

```Dockerfile
FROM nginx:alpine

COPY dist /usr/share/nginx/html

```

Create the docker image: `docker build -t mystaticppt .`

And run the container: `docker run --name myslides --rm -p 80:80 mystaticppt`

You can visit your slides from http://localhost/
