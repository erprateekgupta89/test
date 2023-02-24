package features;
import com.intuit.karate.Runner;
import com.intuit.karate.Results;
import org.junit.Test;

import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.BeforeClass;
import org.apache.commons.io.FileUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
public class TestRunner {
	
	@BeforeClass
	public static void before() {
		System.setProperty("karate.env","qa");
	}
	@Test
	public void  testParallel() {

	//Results results = Runner.path("classpath:features").parallel(5);
	Results results = Runner.path("classpath:features").outputCucumberJson(true).parallel(5);
	generateReport(results.getReportDir());
	//assertEquals(0, results.getFailCount(), results.getErrorMessages());
	assertTrue(results.getErrorMessages(), results.getFailCount() == 0);  
	}
	
	  public static void generateReport(String karateOutputPath) {
	  
	  Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath),
	  new String[] {"json"}, true); List<String> jsonPaths = new
	  ArrayList<>(jsonFiles.size()); jsonFiles.forEach(file ->
	  jsonPaths.add(file.getAbsolutePath())); Configuration config = new
	  Configuration(new File("target"), "KarateAutomationFrameworkUIandAPI"); ReportBuilder
	  reportBuilder = new ReportBuilder(jsonPaths, config);
	  reportBuilder.generateReports();
	  
	  }
	 

	
}
