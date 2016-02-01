Running the maven example
=========================

This is a simple demo project that uses Vaadin TestBench. The project produces 
a standard WAR file containing a simple calculator application written with Vaadin. 
During the build phase the artifact is tested using Vaadin TestBench. 

The project is built using Maven. A similar setup can be done using other build
systems as well. The maven project can easily be imported into any IDE supporting 
Maven or used via the command line interface. Maven can be downlaoded from:
http://maven.apache.org

During the build process TestBench tests are automatically run against the final
war file using a Jetty server. Java classes (JUnit tests in this project) ending 
in "ITCase" are considered integration tests. The tests can be run from the
command line by issuing the following command:

	mvn verify

If you are running specific tests directly via an IDE, you might need to deploy the
project beforehand to http://localhost:8080/. Any method will do, but the easiest
one is probably Maven and the jetty-maven-plugin:

	mvn jetty:run


About the maven example project
===============================

How the project was created
---------------------------
The project is based on the vaadin-archetype-application archetype and originally 
created like this:

	mvn archetype:generate \
	-DarchetypeGroupId=com.vaadin \
	-DarchetypeArtifactId=vaadin-archetype-application \
	-DarchetypeVersion=LATEST \
	-DgroupId=your.company \
	-DartifactId=project-name \
	-Dversion=1.0 \
	-Dpackaging=war

After the project was generated, the pom.xml was edited and the following 
dependencies were added:

	<dependency>
		<groupId>com.vaadin</groupId>
		<artifactId>vaadin-testbench</artifactId>
		<version>4.0.0.alpha3</version>
		<scope>test</scope>
	</dependency>
	<dependency>
		<groupId>junit</groupId>
		<artifactId>junit</artifactId>
		<version>4.11</version>
		<scope>test</scope>
	</dependency>

And optionally for BDD with JBehave:

    <dependency>
        <groupId>org.jbehave</groupId>
        <artifactId>jbehave-core</artifactId>
        <version>3.7.5</version>
        <scope>test</scope>
    </dependency>

Additionally jetty-maven-plugin is used to automatically deploy the war to a Jetty server 
during the integration-test phase and maven-failsafe-plugin is configured to run tests 
named using the *ITCase convention as well as all BDD tests in the com.vaadin.testbenchexample.bdd
package from the src/test/java directory. Check their setup in the pom.xml file.

That's it.


Screenshot comparison in the example project
---------------------------------------------
The screenshot comparison example tests are disabled by default. See the "Screenshot\_Comparison\_Tests.pdf"
document for instructions on how to enable them and, if necessary, update the reference images.