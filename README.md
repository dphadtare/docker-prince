# Docker for Princexml

Dockerfile for building Docker images with [Prince](https://www.princexml.com/) installed.

Since there are specific arch type docker images available officially for [prince](https://www.princexml.com/) hence to fullfill our requirements, we'll provide it internally.
You can refer to official docker images [here](https://hub.docker.com/r/yeslogic/prince)

[Prince Documentation](https://www.princexml.com/doc/server-integration/#prince-docker-image)

## Using
Images are available with the following tags
* `dphadatare/prince:14.3`

### Installing
Add below lines to your dockerfile

```dockerfile
COPY --from=dphadatare/prince:14.3 /usr/local/bin/prince /usr/local/bin/prince
COPY --from=dphadatare/prince:14.3 /usr/local/lib/prince /usr/local/lib/prince
```


### Usage example

##### use as a application
```shell
docker run --rm -it -v $(pwd):/out dphadatare/prince:14.3 https://example.com/ -o /out/example.pdf
```

##### use with php wrapper
```php
if( !\Psi\Libraries\ExternalPrinceWrapper\CPrinceFactory::checkPrinceInstalled() ) {
    $objPrince = \Psi\Libraries\ExternalPrinceWrapper\CPrinceFactory::createPrince();
    $objPrince->setHTML( 1 );
    $objPrince->convert_string_to_file( '<html><body>This is test pdf created from princexml</body></html>', 'test.pdf', $arrstrError );
}
```
