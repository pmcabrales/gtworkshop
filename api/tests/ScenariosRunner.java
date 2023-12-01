import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = {},
        plugin = { "html", "html:../reports/apidevtests/report.html",
                "json:../reports/apidevtests/Cucumber.json",
                "junit:../reports/apidevtests/Cucumber.xml" },
        tags = "@IGWorkshop and not @ignore"
)
public class ScenariosRunner {
}