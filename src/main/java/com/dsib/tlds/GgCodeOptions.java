package com.dsib.tlds;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.dsib.entity.GgCode;
import com.dsib.service.GgCodeService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

public class GgCodeOptions extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String codeType;
	private String remark;
	private String selected;
	private String exclude;

	private GgCodeService ggCodeService;

	public GgCodeOptions(){
		ApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
		ggCodeService  = (GgCodeService) context.getBean("ggCodeService");
	}
	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		return super.doEndTag();
	}

	@Override
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			GgCode ggCode = new GgCode();
			ggCode.setCodetype(codeType);
			ggCode.setRemark(remark);
			List<GgCode> list = ggCodeService.getGgCodeByObj(ggCode);
			StringBuffer options = new StringBuffer(100);
			if(list != null && list.size() >0){
				for(int i=0;i<list.size();i++){
					GgCode gc = list.get(i);
					if(exclude != null && exclude.equals(gc.getCodecname())){
						continue;
					}
					if(selected != null && selected.equals(gc.getCodecode())){
						options.append("<option value='"+gc.getCodecode()+"' selected ='selected'>"+gc.getCodecname()+"</option>");
					}else{
						options.append("<option value='"+gc.getCodecode()+"'>"+gc.getCodecname()+"</option>");
					}
				}
			}
			out.write(options.toString());
			out.flush();
		} catch (Exception e) {
			throw new JspException(e.getMessage());
		}
		return super.doStartTag();
	}

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSelected() {
		return selected;
	}

	public void setSelected(String selected) {
		this.selected = selected;
	}

	public String getExclude() {
		return exclude;
	}

	public void setExclude(String exclude) {
		this.exclude = exclude;
	}
}
