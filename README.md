# LDrawParser
LDrawParser comes as two ANTLR4 grammars for generating LDraw lexer and parser programs.

## Installation & Usage
Install LDrawParser into your local repository by typing
```
mvn clean generate-sources install package
```
and add a dependency to your project's `pom.xml` like this
```xml
<dependency>
	<groupId>de.dfki.resc28</groupId>
  	<artifactId>LDrawParser</artifactId>
  	<version>0.1</version>
</dependency>
```

Happy parsing!

## Contributing
Contributions are very welcome.

## License
This source distribution is subject to the license terms in the LICENSE file found in the top-level directory of this distribution.
You may not use this file except in compliance with the License.

## Third-party Contents
This source distribution includes the third-party items with respective licenses as listed in the THIRD-PARTY file found in the top-level directory of this distribution.

## Acknowledgements
This work has been supported by the [German Ministry for Education and Research (BMBF)](http://www.bmbf.de/en/index.html) (FZK 01IMI3001 J) as part of the [ARVIDA](http://www.arvida.de/) project.
