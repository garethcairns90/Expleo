package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import constants.Config;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.imageio.ImageIO;

import net.sourceforge.tess4j.*;

public class LandingPage {

	WebDriver driver;
	public String firstAnswer;
	public String redButtonId;
	public String greenButtonId;
	
	public By canvas = By.id("canvas");
	public By table = By.xpath("//*[@id=\"content\"]/div/div/div/div[2]/table");
	
	public By editLink = By.xpath("//*[@id='content']/div/div/div/div[2]/table/tbody/tr[1]/td[7]/a[1]");
	public By deleteLink = By.xpath("//*[@id='content']/div/div/div/div[2]/table/tbody/tr[1]/td[7]/a[2]");
	public By image = By.xpath("//img[@alt='Fork me on GitHub']");
	public By githubTitle = By.xpath("//span[@class='author flex-self-stretch']");
	public By elementalSeleniumLink = By.xpath("//*[@id='page-footer']/div/div/a");
	public By elementalSeleniumPageTitle = By.xpath("//h1[contains(text(),'Elemental Selenium')]");
	
	By title = By.xpath("//*[@id=\"content\"]/div/h3");
	By blueBtn = By.className("button");
	public By redBtn = By.cssSelector(".button.alert");
	public By greenBtn = By.cssSelector(".button.success");
	
	public LandingPage(WebDriver driver) {
		this.driver = driver;
	}

	public String getTableColumnRowContent(String column, String row) {
		String xPath = "//*[@id=\"content\"]/div/div/div/div[2]/table/tbody/tr[" + row + "]/td[" + column + "]";
		return this.driver.findElement(By.xpath(xPath)).getText();
	}
	
	public List<String> getTableEntireRowContent(String row) {
		
		 List<String> rowData = new ArrayList<String>();
		
		for (int i=1; i<=6; i++) {
			String data = this.getTableColumnRowContent(String.valueOf(i), row);
			rowData.add(data);
		}
		
		return rowData;
	}
	
	public boolean searchTableContent(String searchText) {
		
		boolean found = false;
		
		 for (int r=1; r<=10; r++) {
				for (int c=1; c<=6; c++) {
					String data = this.getTableColumnRowContent(String.valueOf(c), String.valueOf(r));
					if(searchText.contentEquals(data)) {
						found = true;
						break;
					}
				}
				
				if(found) {
					break;
				}
		 }
		
		
		return found;
	}
	
	public String getTitle() {
		return this.driver.findElement(title).getText();
	}
	
	public WebElement getBlueBtn() {
		return this.driver.findElement(blueBtn);
	}
	
	public WebElement getRedBtn() {
		return this.driver.findElement(redBtn);
	}
	
	public WebElement getGreenBtn() {
		return this.driver.findElement(greenBtn);
	}
	
	public void clickBtn(WebElement btn) {
		btn.click();
	}
	
	// gareth
	public WebElement getEditLink() {
		return this.driver.findElement(editLink);
	}
	
	// gareth
	public WebElement getDeleteLink() {
		return this.driver.findElement(deleteLink);
	}
	
	public WebElement getImage() {
		return this.driver.findElement(image);
	}
	
	public WebElement getElementalSeleniumLink() {
		return this.driver.findElement(elementalSeleniumLink);
	}
	
	public void clickLink(WebElement link) {
		link.click();
	}
	
	public String getURL() {
		return this.driver.getCurrentUrl();
	}
	
	public WebElement getCanvas() {
		return this.driver.findElement(canvas);
	}
	
	public String getCanvasOcrAnswer() throws IOException, InterruptedException {
		
		// get canvas by id then executes javascript to get base64 string
		JavascriptExecutor js = (JavascriptExecutor)this.driver;		
		String base64Canvas = js.executeScript("return arguments[0].toDataURL('image/png').substring(22);", this.getCanvas()).toString();
		
		// convert base64 into byte array
		byte[] decodeBytes = Base64.getDecoder().decode(base64Canvas.getBytes());
		ByteArrayInputStream bis = new ByteArrayInputStream(decodeBytes);
		
		// creates buffered image
		BufferedImage image = ImageIO.read(bis);
		bis.close();

		// write the image to a file
		File outputfile = new File(Config.testResourcesDataPath, "img.png");
		ImageIO.write(image, "png", outputfile);
		
		// use tesseract library for OCR
        ITesseract instance = new Tesseract(); 
        instance.setDatapath(new File(Config.datapath).getPath());

        String answer;
        
        try {
            String result = instance.doOCR(outputfile);
            answer = result.split("\\s+")[1];
            
        } catch (TesseractException e) {
            System.err.println(e.getMessage());
            return null;
        }
		
        return answer;
	}
}