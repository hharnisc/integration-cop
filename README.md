# Integration Cop

A docker image for running integration tests

**Running Integration Tests**

```bash
$ docker run -v ./tests:/tests -w /tests hharnisc/integration-cop mocha
```

You can also write your tests in ES6 with babel

```bash
$ docker run -v ./tests:/tests -w /tests hharnisc/integration-cop mocha --compilers js:babel/register
```

**An Example Test**

```javascript
// tests/test.js
"use strict";

import { expect } from "chai";
import http from "http";

describe("Time Service Integration Tests", () => {
  it("does GET /thetime", (done) => {
    http.get('http://service-time:8080/v1/thetime', function (res) {
      expect(res.statusCode).to.equal(200);
      done();
    });
  });
});
```

**With Docker Compose**

```yml
# docker-compose.yml
service-time:
  build: .
  ports:
    - "8080:8080"
integration-cop:
  image: hharnisc/integration-cop
  command: mocha --compilers js:babel/register
  volumes:
    - ./integration-tests:/integration-tests # make the integration tests available to integration-cop
  working_dir: /integration-tests
  links:
    - service-time # link the service so we can test it
```
