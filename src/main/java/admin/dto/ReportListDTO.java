package admin.dto;

public class ReportListDTO {
	private int targetIdx;
	private String reportTarget;
	private String reportContent;
	private String reporter;
	private String reportTime;
	
	
	public int getTargetIdx() {return targetIdx;}
	public void setTargetIdx(int targetIdx) {this.targetIdx = targetIdx;}
	public String getReportTarget() {return reportTarget;}
	public void setReportTarget(String reportTarget) {this.reportTarget = reportTarget;}
	public String getReportContent() {return reportContent;}
	public void setReportContent(String reportContent) {this.reportContent = reportContent;}
	public String getReporter() {return reporter;}
	public void setReporter(String reporter) {this.reporter = reporter;}
	public String getReportTime() {return reportTime;}
	public void setReportTime(String reportTime) {this.reportTime = reportTime;}

	
	public ReportListDTO() {super();}
	
	
	public ReportListDTO(int targetIdx, String reportTarget, String reportContent, String reporter, String reportTime) {
		super();
		this.targetIdx = targetIdx;
		this.reportTarget = reportTarget;
		this.reportContent = reportContent;
		this.reporter = reporter;
		this.reportTime = reportTime;
	}
	
	
	
}
	
