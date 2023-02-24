package uiAutomation;
import com.intuit.karate.Runner;
import com.intuit.karate.Results;
import org.junit.Test;

import static org.junit.Assert.assertTrue;
import org.apache.commons.io.FileUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
public class TestRunner {
	
	@Test
	public void  testParallel() {


		//Results results = Runner.path("classpath:uiAutomation").parallel(1);
	Results results = Runner.path("classpath:uiAutomation").outputCucumberJson(true).parallel(1);
	generateReport(results.getReportDir());
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
