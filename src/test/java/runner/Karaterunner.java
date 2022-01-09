package runner;

import org.junit.runner.RunWith;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;

import cucumber.api.CucumberOptions;

@RunWith(Karate.class)
@KarateOptions(features="src/test/java/features/Incidentmanagement.feature")
public class Karaterunner {

}
