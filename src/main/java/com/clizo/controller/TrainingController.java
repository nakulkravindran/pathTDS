package com.clizo.controller;

import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.TimeZone;
import java.util.stream.Collectors;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clizo.dao.ApplicantRegisterDao;
import com.clizo.dao.EvaluationDao;
import com.clizo.dao.ExamDao;
import com.clizo.dao.ExamIdDao;
import com.clizo.dao.QuestionPaperDao;
import com.clizo.dao.QuestionPaperQnDao;
import com.clizo.dao.QustnBankDao;
import com.clizo.dao.ResultDao;
import com.clizo.dao.TrainingDao;
import com.clizo.dao.TrainingRegisterDao;
import com.clizo.dao.parameterDao;
import com.clizo.dao.traheader1Dao;
import com.clizo.dao.traheader2Dao;
import com.clizo.dao.traheader3Dao;
import com.clizo.dao.traheader4Dao;
import com.clizo.mail.EmailUtil;
import com.clizo.model.ApplicantManagerPOJO;
import com.clizo.model.ApplicantRegisterModel;
import com.clizo.model.EvaluationModel;
import com.clizo.model.ExamModel;
import com.clizo.model.QuestionBankModel;
import com.clizo.model.QuestionPaperModel;
import com.clizo.model.QuestionPaperQnModel;
import com.clizo.model.ResultComparatorUpgrade;
import com.clizo.model.ResultModel;
import com.clizo.model.Training;
import com.clizo.model.TrainingModel;
import com.clizo.model.TrainingRegstrationModel;
import com.clizo.model.parameterModel;
import com.clizo.model.traheader1Model;
import com.clizo.model.traheader2Model;
import com.clizo.model.traheader3Model;
import com.clizo.model.traheader4Model;
import com.clizo.properties.demo;

@Controller
public class TrainingController {

	@Autowired
	HttpSession httpSession;
	@Autowired
	TrainingDao trainingdao;
	@Autowired
	TrainingRegisterDao TrainingRegisterDao;
	@Autowired
	parameterDao parameterDao;
	@Autowired
	traheader1Dao traheader1Dao;
	@Autowired
	traheader2Dao traheader2Dao;
	@Autowired
	traheader4Dao traheader4Dao;
	@Autowired
	traheader3Dao traheader3Dao;
	@Autowired
	ViewController viewController;

	/*------*/
	@Autowired
	EvaluationDao evaluationDao;
	@Autowired
	ExamDao examDao;
	@Autowired
	ApplicantRegisterDao applicantRegisterDao;
	@Autowired
	QuestionPaperDao questionPaperDao;
	@Autowired
	QustnBankDao qustnbankdao;
	@Autowired
	QuestionPaperQnDao questionpaperqndao;
	@Autowired
	QuestionPaperDao QuestionPaperDao;

	@Autowired
	ResultDao resultdao;

	@Autowired
	ExamIdDao examIdDao;

	private String workingDir = System.getProperty("user.dir");
	static String fromEmail = "";
	static String password = "P@thcad20"; // correct password for mail id

	@RequestMapping(value = "/mailEvalLinkIndv", method = RequestMethod.POST) // for view training details
	public @ResponseBody String mailEvalLinkIndv(@RequestParam(value = "traingid", required = false) String traingid,
			@RequestParam(value = "registrationid", required = false) String registrationid, Model model) {
		TrainingRegstrationModel traRegM = TrainingRegisterDao.findById(Long.valueOf(registrationid));
		String mailStr = new String();
		mailStr = "Dear " + traRegM.getCandidateName() + ", ";
		mailStr = mailStr + "<br/> Thank you for attending the below training <b> "
				+ trainingdao.findById(Long.parseLong(traRegM.getTrainingid())).getName() + " </b> on <b>"
				+ trainingdao.findById(Long.parseLong(traRegM.getTrainingid())).getStartdt()
				+ "</b>. Please fill up the training evaluation sheet and submit the same maximum by tomorrow. You can access the training evaluation sheet via the below link:";
		mailStr = mailStr
				+ "<br/>				<a href='http://academy.path-solutions.com:9095/pathTDS/TrainingEvaluation?traId="
				+ traingid + "&traRegId=" + traRegM.getId() + "'>(Evaluation Link)</a>";
		mailStr = mailStr
				+ "<br/>	Please submit the evaluation  on time. Your evaluation will help the trainer and Corporate Academy to improve further. ";
		mailStr = mailStr + "<br/>	Regards,";
		mailStr = mailStr + "<br/>	<b>Corporate Academy, Path Solutions </b>";
		mailStr = mailStr + "<br/> E mail: CorporateAcademy@path-solutions.com";

		final String toEmail = traRegM.getEmail(); // can be any email id

		EmailUtil.sendEmail(getMailSession(), fromEmail, "", toEmail, "Training Evaluation", mailStr);

		return "";
	}

	private Session getMailSession() {
		try {
			Properties prop = new Properties();
			InputStream cvs = demo.class.getResourceAsStream("config.properties");

			System.out.println("String get :" + cvs);
			Properties props = new Properties();

			if (cvs != null) {
				try {
					prop.load(cvs);
				} catch (Exception ex) {
					System.out.println("error " + ex);
				}

				fromEmail = prop.getProperty("fromEmail"); // requires valid mail id
				password = prop.getProperty("password"); // correct password for mail id

				System.out.println("TDSEmail Start > Read From File");
				props.put("mail.smtp.host", prop.getProperty("mail.smtp.host")); // SMTP Host
				props.put("mail.smtp.port", prop.getProperty("mail.smtp.port")); // TLS Port
				props.put("mail.smtp.auth", prop.getProperty("mail.smtp.auth")); // enable authentication
				props.put("mail.smtp.starttls.enable", prop.getProperty("mail.smtp.starttls.enable")); // enable
																										// STARTTLS
			} else {
				fromEmail = "CorporateAcademy@path-solutions.com";
				password = "P@thcad20"; // correct password for mail
				System.out.println("TDSEmail Start  > Default Config");
				props.put("mail.smtp.host", "mailrelay.path.local"); // SMTP Host
				props.put("mail.smtp.port", "25"); // TLS Port
				props.put("mail.smtp.auth", "true"); // enable authentication
				props.put("mail.smtp.starttls.enable", "false"); // enable STARTTLS

			}
			// create Authenticator object to pass in Session.getInstance argument
			Authenticator auth = new Authenticator() {
				// override the getPasswordAuthentication method
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
			};
			Session session = Session.getInstance(props, auth);
			return session;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/mailEvalLink", method = RequestMethod.POST) // for view training details
	public @ResponseBody String mailEvalLink(@RequestParam(value = "traingid", required = false) String traingid,
			Model model) {
		try {
			List<TrainingModel> paramList = trainingdao.findAll();
			List<TrainingRegstrationModel> traRegister = TrainingRegisterDao.findAll();
			model.addAttribute("paramList", paramList);
			TrainingModel paList = null;
			if (!StringUtils.isEmpty(traingid)) {
				paList = trainingdao.findById(Long.valueOf(traingid));
				traRegister = traRegister.stream()
						.filter(str -> str.getTrainingid().equals(traingid)
								&& str.getApprovalStatus().equals("Approved") && str.getAttendance().equals("Yes"))
						.collect(Collectors.toList());

				traheader1Model traheader1Model = traheader1Dao.findById(Long.valueOf(paList.getEvalformno()));
				if (traRegister.size() > 0) {
					for (TrainingRegstrationModel traRegM : traRegister) {
						String mailStr = new String();
						mailStr = "Dear " + traRegM.getCandidateName() + ", ";
						mailStr = mailStr + "<br/> Thank you for attending the below training <b> "
								+ trainingdao.findById(Long.parseLong(traRegM.getTrainingid())).getName()
								+ " </b> on <b>"
								+ trainingdao.findById(Long.parseLong(traRegM.getTrainingid())).getStartdt()
								+ "</b>. Please fill up the training evaluation sheet and submit the same maximum by tomorrow. You can access the training evaluation sheet via the below link:";
						mailStr = mailStr
								+ "<br/>				<a href='http://academy.path-solutions.com:9095/pathTDS/TrainingEvaluation?traId="
								+ traingid + "&traRegId=" + traRegM.getId() + "'>(Evaluation Link)</a>";
						mailStr = mailStr
								+ "<br/>	Please submit the evaluation  on time. Your evaluation will help the trainer and Corporate Academy to improve further. ";
						mailStr = mailStr + "<br/>	Regards,";
						mailStr = mailStr + "<br/>	<b>Corporate Academy, Path Solutions </b>";
						mailStr = mailStr + "<br/> E mail: CorporateAcademy@path-solutions.com";

						final String toEmail = traRegM.getEmail(); // can be any email id

						EmailUtil.sendEmail(getMailSession(), fromEmail, "", toEmail, "Training Evaluation", mailStr);

					}
					return "Email send successfully";
				} else {
					return "No applicants to send mail";
				}
			}
		} catch (Exception e) {
			return e.toString();
		}

		return "Email";

	}

	@RequestMapping(value = "/mailExmApprovalsIndv", method = RequestMethod.POST) // for view training details
	public @ResponseBody String mailExmApprovalsIndv(@RequestParam(value = "app", required = false) String app,
			Model model) {
		try {
			ApplicantRegisterModel applicantRegisterModel = applicantRegisterDao.findById(Long.valueOf(app));

			ExamModel exam = examDao.findByExamId(applicantRegisterModel.getExamId());
			QuestionPaperModel questionPaper = QuestionPaperDao
					.findByQuestionpaperid(Long.valueOf(exam.getQuestionPaperNumber()));
			Integer i = Integer.parseInt(questionPaper.getTotal_time_allowed());
			Integer h = i / 60;
			Integer m = i % 60;
			String mailStr = new String();
			mailStr = "Dear " + applicantRegisterModel.getCandidateName() + ", ";
			mailStr = mailStr
					+ " <br/> The Corporate Academy is pleased to inform you that your registration to be below exam has been approved. The Exam details and the Exam portal login credential details are given below. Note that you will be able to access the Exam portal on the date and time of the exam.";
			mailStr = mailStr + " <br/> <b>Exam Details:</b>";
			mailStr = mailStr + " <br/> Name of the Examination: " + exam.getExamName();
			mailStr = mailStr + " <br/> Date of the Examination : " + exam.getExamDate();
			String _24HourTime = exam.getExamTime();
			SimpleDateFormat _24HourSDF = new SimpleDateFormat("HH:mm");
			SimpleDateFormat _12HourSDF = new SimpleDateFormat("hh:mm a");
			Date _24HourDt;
			_24HourDt = _24HourSDF.parse(_24HourTime);
			/*
			 * System.out.println(_24HourDt);
			 * System.out.println(_12HourSDF.format(_24HourDt));
			 */
			// mailStr=mailStr+" <br/> Exam start time : "+exam.getExamTime()+ " (Kuwait
			// time- GMT+3)";
			mailStr = mailStr + " <br/> Exam start time : " + _12HourSDF.format(_24HourDt) + " (Kuwait time- GMT+3)";
			mailStr = mailStr + " <br/> Duration of the exam:" + h.toString() + " hours " + m.toString() + " minutes"; // exam.getExamTime();
			mailStr = mailStr
					+ " <br/> Note that your  exam starting time will be your corresponding local time of the Kuwait time (GMT+3) mentioned. above";
			mailStr = mailStr + " <br/> <b>Exam portal login credentials:</b>";
			mailStr = mailStr
					+ " <br/> Exam Portal link:  http://academy.path-solutions.com:9095/pathTDS/applicantLogin";
			mailStr = mailStr + " <br/> User Name: " + applicantRegisterModel.getEmailId();
			mailStr = mailStr + " <br/> Password: " + applicantRegisterModel.getApplicantPassword();
			mailStr = mailStr + " <br/> Exam ID: " + applicantRegisterModel.getExamId();
			mailStr = mailStr
					+ " <br/> Please take a copy of this e mail to the examination hall. Contact Corporate Academy for any further details. ";
			mailStr = mailStr + " <br/> Wish you good luck.";
			mailStr = mailStr + " <br/> <b>Regards,</b>";
			mailStr = mailStr + " <br/> <b>Corporate Academy, Path Solutions</b>";
			mailStr = mailStr + " <br/> E mail: CorporateAcademy@path-solutions.com";

			final String toEmail = applicantRegisterModel.getEmailId(); // can be any email id

			EmailUtil.sendEmail(getMailSession(), fromEmail, "", toEmail, "Registration Approved", mailStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "Email send successfully";
	}

	@RequestMapping(value = "/mailExmApprovals", method = RequestMethod.POST) // for view training details
	public @ResponseBody String mailExmApprovals(@RequestParam(value = "examId", required = false) String examId,
			Model model) {
		try {
			List<ApplicantRegisterModel> applicantRegisterModel = null;

			if (examId != null) {
				applicantRegisterModel = applicantRegisterDao.findByExamId(examId);
				applicantRegisterModel = applicantRegisterModel.stream().filter(x -> {
					return x.getApprovalStatus().equalsIgnoreCase("Approove");
				}).collect(Collectors.toList());

				if (applicantRegisterModel.size() > 0) {
					for (ApplicantRegisterModel appRegM : applicantRegisterModel) {
						ExamModel exam = examDao.findByExamId(appRegM.getExamId());
						QuestionPaperModel questionPaper = QuestionPaperDao
								.findByQuestionpaperid(Long.valueOf(exam.getQuestionPaperNumber()));
						Integer i = Integer.parseInt(questionPaper.getTotal_time_allowed());
						Integer h = i / 60;
						Integer m = i % 60;
						String mailStr = new String();
						mailStr = "Dear " + appRegM.getCandidateName() + ", ";
						mailStr = mailStr
								+ " <br/> The Corporate Academy is pleased to inform you that your registration to be below exam has been approved. The Exam details and the Exam portal login credential details are given below. Note that you will be able to access the Exam portal on the date and time of the exam.";
						mailStr = mailStr + " <br/> <b>Exam Details:</b>";
						mailStr = mailStr + " <br/> Name of the Examination: " + exam.getExamName();
						mailStr = mailStr + " <br/> Date of the Examination : " + exam.getExamDate();
						String _24HourTime = exam.getExamTime();
						SimpleDateFormat _24HourSDF = new SimpleDateFormat("HH:mm");
						SimpleDateFormat _12HourSDF = new SimpleDateFormat("hh:mm a");
						Date _24HourDt;
						_24HourDt = _24HourSDF.parse(_24HourTime);
						/*
						 * System.out.println(_24HourDt);
						 * System.out.println(_12HourSDF.format(_24HourDt));
						 */
						// mailStr=mailStr+" <br/> Exam start time : "+exam.getExamTime()+ " (Kuwait
						// time- GMT+3)";
						mailStr = mailStr + " <br/> Exam start time : " + _12HourSDF.format(_24HourDt)
								+ " (Kuwait time- GMT+3)";
						mailStr = mailStr + " <br/> Duration of the exam:" + h.toString() + " hours " + m.toString()
								+ " minutes"; // exam.getExamTime();
						mailStr = mailStr
								+ " <br/> Note that your  exam starting time will be your corresponding local time of the Kuwait time (GMT+3) mentioned. above";
						mailStr = mailStr + " <br/> <b>Exam portal login credentials:</b>";
						mailStr = mailStr
								+ " <br/> Exam Portal link:  http://academy.path-solutions.com:9095/pathTDS/applicantLogin";
						mailStr = mailStr + " <br/> User Name: " + appRegM.getEmailId();
						mailStr = mailStr + " <br/> Password: " + appRegM.getApplicantPassword();
						mailStr = mailStr + " <br/> Exam ID: " + appRegM.getExamId();
						mailStr = mailStr
								+ " <br/> Please take a copy of this e mail to the examination hall. Contact Corporate Academy for any further details. ";
						mailStr = mailStr + " <br/> Wish you good luck.";
						mailStr = mailStr + " <br/> <b>Regards,</b>";
						mailStr = mailStr + " <br/> <b>Corporate Academy, Path Solutions</b>";
						mailStr = mailStr + " <br/> E mail: CorporateAcademy@path-solutions.com";

						final String toEmail = appRegM.getEmailId(); // can be any email id

						EmailUtil.sendEmail(getMailSession(), fromEmail, "", toEmail, "Registration Approved", mailStr);

					}

					return "Email send successfully";
				} else {
					return "No applicants to send mail";
				}
			}

			// return "Email";

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Email";
	}

	@RequestMapping(value = "/mailExmRejectionsIndv", method = RequestMethod.POST) // for view training details
	public @ResponseBody String mailExmRejectionsIndv(@RequestParam(value = "app", required = false) String app,
			Model model) {

		ApplicantRegisterModel applicantRegisterModel = applicantRegisterDao.findById(Long.valueOf(app));

		ExamModel exam = examDao.findByExamId(applicantRegisterModel.getExamId());
		String mailStr = new String();
		mailStr = "Dear " + applicantRegisterModel.getCandidateName() + ", ";
		mailStr = mailStr + "<br/> Regret to inform you that your registration for the  exam " + exam.getExamName()
				+ "  on " + exam.getExamDate()
				+ " has been rejected. You may please contact Corporate Academy for further details.";
		mailStr = mailStr + "<br/> Regards,";
		mailStr = mailStr + "<br/> <b>Corporate Academy, Path Solutions</b>";
		mailStr = mailStr + "<br/> E mail: CorporateAcademy@path-solutions.com";

		final String toEmail = applicantRegisterModel.getEmailId(); // can be any email id

		EmailUtil.sendEmail(getMailSession(), fromEmail, applicantRegisterModel.getLineManagerEmail(), toEmail,
				"Registration Rejected", mailStr);

		return "Email send successfully";
	}

	@RequestMapping(value = "/mailExmRejections", method = RequestMethod.POST) // for view training details
	public @ResponseBody String mailExmRejections(@RequestParam(value = "examId", required = false) String examId,
			Model model) {

		List<ApplicantRegisterModel> applicantRegisterModel = null;

		if (examId != null) {
			applicantRegisterModel = applicantRegisterDao.findByExamId(examId);
			applicantRegisterModel = applicantRegisterModel.stream().filter(x -> {
				return x.getApprovalStatus().equalsIgnoreCase("Reject");
			}).collect(Collectors.toList());

			if (applicantRegisterModel.size() > 0) {
				for (ApplicantRegisterModel appRegM : applicantRegisterModel) {
					ExamModel exam = examDao.findByExamId(appRegM.getExamId());
					String mailStr = new String();
					mailStr = "Dear " + appRegM.getCandidateName() + ", ";
					mailStr = mailStr + "<br/> Regret to inform you that your registration for the  exam "
							+ exam.getExamName() + "  on " + exam.getExamDate()
							+ " has been rejected. You may please contact Corporate Academy for further details.";
					mailStr = mailStr + "<br/> Regards,";
					mailStr = mailStr + "<br/> <b>Corporate Academy, Path Solutions</b>";
					mailStr = mailStr + "<br/> E mail: CorporateAcademy@path-solutions.com";

					final String toEmail = appRegM.getEmailId(); // can be any email id

					EmailUtil.sendEmail(getMailSession(), fromEmail, appRegM.getLineManagerEmail(), toEmail,
							"Registration Rejected", mailStr);

				}
				return "Email send successfully";
			} else {
				return "No applicants to send mail";
			}
		}

		return "Email";

	}

	@RequestMapping(value = "/mailExmResultsIndv", method = RequestMethod.POST) // for view training details
	public @ResponseBody String mailExmResultsIndv(@RequestParam(value = "examId", required = false) String examId,
			@RequestParam(value = "qnpaper", required = false) String qnpaper,
			@RequestParam(value = "app", required = false) String app, Model model) {

		try {

			List<ExamModel> examList;
			List<ResultModel> resultModels = null;

			HashMap<Long, ApplicantRegisterModel> applicantDetails = new HashMap<>();
			final ApplicantRegisterModel[] applicantInfo = new ApplicantRegisterModel[1];
			HashMap<String, Integer> sectionData = new HashMap<>();
			ArrayList<String> sectionNames = new ArrayList<>();

			sectionData.put("Default", 0);
			sectionNames.add("Default");

			final long[] totalTimeTakenByCandidates = new long[1];
			final int[] candidatesPassed = { 0 };
			final int[] candidatesPassedNew = { 0 };

			examList = examDao.findAll();

			if (examId != null) {
				examList.forEach(exam -> {
					if (exam.getExamId() != null && exam.getExamId().equals(examId)) {
						QuestionPaperModel questionPaper = QuestionPaperDao
								.findByQuestionpaperid(Long.valueOf(exam.getQuestionPaperNumber()));
						if (!StringUtils.isEmpty(questionPaper.getSection1())
								|| !StringUtils.isEmpty(questionPaper.getSection2())
								|| !StringUtils.isEmpty(questionPaper.getSection3())
								|| !StringUtils.isEmpty(questionPaper.getSection4())) {

							sectionData.put(questionPaper.getSection1(), 0);
							sectionData.put(questionPaper.getSection2(), 0);
							sectionData.put(questionPaper.getSection3(), 0);
							sectionData.put(questionPaper.getSection4(), 0);

							sectionNames.add(questionPaper.getSection1());
							sectionNames.add(questionPaper.getSection2());
							sectionNames.add(questionPaper.getSection3());
							sectionNames.add(questionPaper.getSection4());

							// sectionNames.sort((s1, s2) -> s1.compareToIgnoreCase(s2));

							model.addAttribute("sectionNames", sectionNames);
						}

						model.addAttribute("examName", exam.getExamName());
						model.addAttribute("examId", examId);
						model.addAttribute("examDate", exam.getExamDate());
						model.addAttribute("questionPaperNumber", exam.getQuestionPaperNumber());

						List<QuestionBankModel> questionBank = new ArrayList();
						List<QuestionPaperQnModel> questionPaperQn = new ArrayList();
						questionPaperQn = questionpaperqndao
								.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber()));
						questionPaperQn.forEach(questionpaperqn -> {
							questionBank.add(qustnbankdao.findByQuestionId(
									Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid()))));
						});

						model.addAttribute("totalExamDuration", questionPaper.getTotal_time_allowed());
						model.addAttribute("maximumScore", questionPaper.getMaximum_score());
						model.addAttribute("passpercentage", questionPaper.getPass_percentage());

						if (!CollectionUtils.isEmpty(sectionData)) {
							questionBank.forEach(question -> {
								if (!StringUtils.isEmpty(question.getSection())) {
									int qnScore = ((questionpaperqndao
											.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber())))
													.stream().filter(x -> {
														return x.getQuestionbankid() == (question.getQuestionId())
																.intValue();
													}).collect(Collectors.toList())).get(0).getScoreperquestion();
									sectionData.replace(question.getSection(),
											sectionData.get(question.getSection()) + qnScore);
								}
							});
							model.addAttribute("sectionData", sectionData);
						}
					}
				});

				resultModels = resultdao.findByExamId(examId);
				Collections.sort(resultModels, new ResultComparatorUpgrade());
				/*
				 * List<ResultModel> resultModelsOld=resultModels.stream().filter(x->{return
				 * x.getFinalResult().equalsIgnoreCase("no");}).collect(Collectors.toList());
				 * List<ResultModel> resultModelsNew=resultModels.stream().filter(x->{return
				 * x.getFinalResult().equalsIgnoreCase("yes");}).collect(Collectors.toList());
				 */
				List<ResultModel> resultModelsOld = resultModels.stream().filter(x -> {
					return x.getScoreType().equalsIgnoreCase("obtained");
				}).collect(Collectors.toList());
				List<ResultModel> resultModelsNew = resultModels.stream().filter(x -> {
					return x.getScoreType().equalsIgnoreCase("new");
				}).collect(Collectors.toList());

				resultModelsOld.forEach((finalResult) -> {
					totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] + finalResult.getTimeTaken();
					if (finalResult.getStatus().equals("Passed")) {
						candidatesPassed[0] = candidatesPassed[0] + 1;
					}

					// applicantInfo[0] =
					// applicantRegisterDao.findOne(finalResult.getApplicantId());
					// applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
				});
				resultModelsNew.forEach((finalResult) -> {
					// totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] +
					// finalResult.getTimeTaken();
					if (finalResult.getStatus().equals("Passed")) {
						candidatesPassedNew[0] = candidatesPassedNew[0] + 1;
					}

					applicantInfo[0] = applicantRegisterDao.findOne(finalResult.getApplicantId());
					applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
				});

				////////////
				ArrayList<ResultModel> resultModelsNew1 = new ArrayList<ResultModel>();
				Integer pass1 = 0;
				Integer fail1 = 0;
				Long avgTm = new Long(0);
				for (ResultModel r : resultModelsOld) {
					String chk = "false";
					for (ResultModel rN : resultModelsNew) {
						if (rN.getApplicantId().longValue() == r.getApplicantId().longValue()) {
							chk = "true";
							avgTm = avgTm + rN.getTimeTaken();
							if (rN.getStatus().equals("Passed")) {
								pass1 = pass1 + 1;
							}
							if (rN.getStatus().equals("Failed")) {
								fail1 = fail1 + 1;
							}
							resultModelsNew1.add(rN);
						}
					}
					if (chk == "false") {
						avgTm = avgTm + r.getTimeTaken();
						if (r.getStatus().equals("Passed")) {
							pass1 = pass1 + 1;
						}
						if (r.getStatus().equals("Failed")) {
							fail1 = fail1 + 1;
						}
						resultModelsNew1.add(r);
					}

				}

				double passPercentage = ((double) pass1 / (double) resultModelsNew1.size()) * 100;
				model.addAttribute("candidatePassPercentage", passPercentage);

				long averageTimeTaken = 0;
				if (resultModelsNew1.size() > 0) {
					// averageTimeTaken = avgTm / resultModelsNew1.size();
					averageTimeTaken = avgTm / resultModelsOld.size();
				}
				TimeZone tz = TimeZone.getTimeZone("UTC");
				SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
				df.setTimeZone(tz);
				model.addAttribute("averageTimeTaken", df.format(new Date(averageTimeTaken * 1000)));

				model.addAttribute("candidatesPassed", pass1);
				model.addAttribute("candidatesFailed", fail1);

				int i = 0;
				int rank = 0;

				if (resultModelsNew1.size() > 0) {
					resultModelsNew1.get(0).setRank(1);
					while (i < (resultModelsNew1.size() - 1)) {

						if (resultModelsNew1.get(i).getTotalScore() == resultModelsNew1.get(i + 1).getTotalScore()) {
							resultModelsNew1.get(i + 1).setRank(resultModelsNew1.get(i).getRank());
						} else {

							resultModelsNew1.get(i + 1).setRank(resultModelsNew1.get(i).getRank() + 1);
						}
						i = i + 1;
					}
				}

				model.addAttribute("applicantDetails", applicantDetails);
				model.addAttribute("resultsOld", resultModelsOld);
				model.addAttribute("resultsNew", resultModelsNew);
				model.addAttribute("resultsNew1", resultModelsNew1);
				model.addAttribute("noOfCandidates", resultModelsNew1.size());

				QuestionPaperModel questionPaper1 = QuestionPaperDao.findByQuestionpaperid(Long.valueOf(qnpaper));
				for (ResultModel rM : resultModelsNew1) {
					// if(rM.getApplicantId()==Long.valueOf(app)){
					if (rM.getApplicantId().equals(Long.valueOf(app))) {
						ApplicantRegisterModel applicantM = applicantRegisterDao.findById(rM.getApplicantId());
						Integer maxSC = 0;
						maxSC = sectionData.get(sectionNames.get(1)) + sectionData.get(sectionNames.get(2))
								+ sectionData.get(sectionNames.get(3)) + sectionData.get(sectionNames.get(4));

						Integer obtSc = 0;
						obtSc = rM.getSection1() + rM.getSection2() + rM.getSection3() + rM.getSection4();

						String mailStr = new String();
						mailStr = "";
						Double scoreper = 0.00;
						if (rM.getTotalScore() > questionPaper1.getMaximum_score()) {
							scoreper = 100.00;
						} else {
							scoreper = (new Double(rM.getTotalScore()) / new Double(questionPaper1.getMaximum_score()))
									* 100;
						}

						if (rM.getStatus().equalsIgnoreCase("failed")) {
							mailStr = "Dear " + rM.getApplicantName() + ", ";
							mailStr = mailStr
									+ "<br/> The Corporate Academy  regrets  to inform you that your performance has not come upto the criteria set to pass the  below examination. Your result details are  given below: ";
							mailStr = mailStr + "<br/> ";
						}
						if (rM.getStatus().equalsIgnoreCase("passed")) {
							mailStr = "Dear " + rM.getApplicantName() + ", ";
							mailStr = mailStr
									+ "<br/> <b>Congratulations!</b> 	The Corporate Academy is pleased to inform you that you have passed the below examination. Your Exam/ result details are also given below: ";
							mailStr = mailStr + "<br/> ";
						}
						mailStr = mailStr + "<br/> ";
						mailStr = mailStr + "<table style='width:100%;text-align:left;'>";
						mailStr = mailStr + "<tr>";
						mailStr = mailStr + "  <th colspan='4'>Exam Details</th>";
						mailStr = mailStr + "</tr>";
						mailStr = mailStr + "<tr>";
						mailStr = mailStr + " <td>Name of the Examination: </td>";
						mailStr = mailStr + "<td>" + (examDao.findByExamId(rM.getExamId())).getExamName() + "</td>";
						mailStr = mailStr + "<td>Maximum Score:</td>";
						mailStr = mailStr + "<td>" + questionPaper1.getMaximum_score() + "</td>";
						mailStr = mailStr + "</tr>";
						mailStr = mailStr + "<tr>";
						mailStr = mailStr + "<td>Date of the examination: </td>";
						mailStr = mailStr + "<td>" + rM.getAttendedDate() + "</td>";
						mailStr = mailStr + "<td>Score % required to pass:</td>";
						mailStr = mailStr + "<td>" + questionPaper1.getPass_percentage() + "% </td>";
						mailStr = mailStr + "</tr>";
						mailStr = mailStr + "<tr>";
						mailStr = mailStr + " <td>Exam ID: </td>";
						mailStr = mailStr + " <td>" + rM.getExamId() + "</td>";
						mailStr = mailStr + " <td>Score obtained:</td>";
						mailStr = mailStr + "  <td>" + rM.getTotalScore() + "</td>";
						mailStr = mailStr + "</tr>";
						mailStr = mailStr + " <tr>";
						mailStr = mailStr + "  <td>Result: </td>";
						if (rM.getStatus().equalsIgnoreCase("failed")) {
							mailStr = mailStr + " <td> NOT QUALIFIED </td>";
						} else {
							mailStr = mailStr + " <td>" + rM.getStatus() + "</td>";
						}
						mailStr = mailStr + "<td>Score % obtained:</td>";
						mailStr = mailStr + "<td>" + String.format("%.2f", scoreper) + "% </td>";
						mailStr = mailStr + "</tr>";
						mailStr = mailStr + "</table>";
						mailStr = mailStr + "<br/>";
						mailStr = mailStr + "<table style='width:100%;text-align:left;'>";
						mailStr = mailStr + "<tr>";
						mailStr = mailStr + "<th>Section Score Details:</th>";
						mailStr = mailStr + "<th>Maximum Score </th>";
						mailStr = mailStr + "<th>Score Obtained</th>";
						mailStr = mailStr + "</tr>";
						mailStr = mailStr + "<tr>";
						mailStr = mailStr + "<td>" + sectionNames.get(1) + "</td>";
						mailStr = mailStr + "<td>" + sectionData.get(sectionNames.get(1)) + "</td>";
						mailStr = mailStr + "<td>" + rM.getSection1() + "</td>";
						mailStr = mailStr + "</tr>";
						mailStr = mailStr + "<tr>";
						mailStr = mailStr + "<td>" + sectionNames.get(2) + "</td>";
						mailStr = mailStr + "<td>" + sectionData.get(sectionNames.get(2)) + "</td>";
						mailStr = mailStr + "<td>" + rM.getSection2() + "</td>";
						mailStr = mailStr + "</tr>";
						mailStr = mailStr + "<tr>";
						mailStr = mailStr + "<td>" + sectionNames.get(3) + "</td>";
						mailStr = mailStr + "<td>" + sectionData.get(sectionNames.get(3)) + "</td>";
						mailStr = mailStr + "<td>" + rM.getSection3() + "</td>";
						mailStr = mailStr + "</tr>";
						mailStr = mailStr + "<tr>";
						mailStr = mailStr + "<td>" + sectionNames.get(4) + "</td>";
						mailStr = mailStr + "<td>" + sectionData.get(sectionNames.get(4)) + "</td>";
						mailStr = mailStr + "<td>" + rM.getSection4() + "</td>";
						mailStr = mailStr + "</tr>";
						mailStr = mailStr + "<tr>";
						mailStr = mailStr + "<td>Total:</td>";
						mailStr = mailStr + "<td>" + maxSC + "</td>";
						mailStr = mailStr + "<td>" + obtSc + "</td>";
						mailStr = mailStr + "</tr>";
						mailStr = mailStr + "</table>";

						if (rM.getStatus().equalsIgnoreCase("failed")) {
							mailStr = mailStr + "Please be confident and attempt again.";
							mailStr = mailStr + "<br/> Regards,";
							mailStr = mailStr + "<br/> <b>Corporate Academy, Path Solutions</b>";
							mailStr = mailStr + "<br/> E mail: CorporateAcademy@path-solutions.com";
						}
						if (rM.getStatus().equalsIgnoreCase("passed")) {
							mailStr = mailStr + "Your certificate will be provided shortly.";
							mailStr = mailStr + "<br/> Regards,";
							mailStr = mailStr + "<br/> <b>Corporate Academy, Path Solutions</b>";
							mailStr = mailStr + "<br/> E mail: CorporateAcademy@path-solutions.com";
						}

						final String toEmail = (applicantRegisterDao.findById(rM.getApplicantId())).getEmailId(); // can
																													// be
																													// any
																													// email
																													// id

						EmailUtil.sendEmail(getMailSession(), fromEmail, applicantM.getLineManagerEmail(), toEmail,
								"Examination Result", mailStr);

					} // end of app
				}

			}

			// model.addAttribute("examList", examList); //// Filter ExamId as the NEW
			// System does not support old exam/result
			List<ResultModel> resultExm = resultdao.findAll();
			HashSet<Object> seen = new HashSet<>();
			resultExm.removeIf(e -> !seen.add(e.getExamId()));
			List<ExamModel> examResLst = new ArrayList<ExamModel>();
			for (ResultModel f : resultExm) {
				examResLst.add(examDao.findByExamId(f.getExamId()));
			}
			examList = examResLst;
			model.addAttribute("examList", examList);
		} catch (Exception e) {
			return e.toString();
		}

		return "Email send successfully.";

	}

	@RequestMapping(value = "/mailExmResults", method = RequestMethod.POST) // for view training details
	public @ResponseBody String mailExmResults(@RequestParam(value = "examId", required = false) String examId,
			@RequestParam(value = "qnpaper", required = false) String qnpaper, Model model) {

		try {
			List<ExamModel> examList;
			List<ResultModel> resultModels = null;

			HashMap<Long, ApplicantRegisterModel> applicantDetails = new HashMap<>();
			final ApplicantRegisterModel[] applicantInfo = new ApplicantRegisterModel[1];
			HashMap<String, Integer> sectionData = new HashMap<>();
			ArrayList<String> sectionNames = new ArrayList<>();

			sectionData.put("Default", 0);
			sectionNames.add("Default");

			final long[] totalTimeTakenByCandidates = new long[1];
			final int[] candidatesPassed = { 0 };
			final int[] candidatesPassedNew = { 0 };

			examList = examDao.findAll();

			if (examId != null) {
				examList.forEach(exam -> {
					if (exam.getExamId() != null && exam.getExamId().equals(examId)) {
						QuestionPaperModel questionPaper = QuestionPaperDao
								.findByQuestionpaperid(Long.valueOf(exam.getQuestionPaperNumber()));
						if (!StringUtils.isEmpty(questionPaper.getSection1())
								|| !StringUtils.isEmpty(questionPaper.getSection2())
								|| !StringUtils.isEmpty(questionPaper.getSection3())
								|| !StringUtils.isEmpty(questionPaper.getSection4())) {

							sectionData.put(questionPaper.getSection1(), 0);
							sectionData.put(questionPaper.getSection2(), 0);
							sectionData.put(questionPaper.getSection3(), 0);
							sectionData.put(questionPaper.getSection4(), 0);

							sectionNames.add(questionPaper.getSection1());
							sectionNames.add(questionPaper.getSection2());
							sectionNames.add(questionPaper.getSection3());
							sectionNames.add(questionPaper.getSection4());

							// sectionNames.sort((s1, s2) -> s1.compareToIgnoreCase(s2));

							model.addAttribute("sectionNames", sectionNames);
						}

						model.addAttribute("examName", exam.getExamName());
						model.addAttribute("examId", examId);
						model.addAttribute("examDate", exam.getExamDate());
						model.addAttribute("questionPaperNumber", exam.getQuestionPaperNumber());

						List<QuestionBankModel> questionBank = new ArrayList();
						List<QuestionPaperQnModel> questionPaperQn = new ArrayList();
						questionPaperQn = questionpaperqndao
								.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber()));
						questionPaperQn.forEach(questionpaperqn -> {
							questionBank.add(qustnbankdao.findByQuestionId(
									Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid()))));
						});

						model.addAttribute("totalExamDuration", questionPaper.getTotal_time_allowed());
						model.addAttribute("maximumScore", questionPaper.getMaximum_score());
						model.addAttribute("passpercentage", questionPaper.getPass_percentage());

						if (!CollectionUtils.isEmpty(sectionData)) {
							questionBank.forEach(question -> {
								if (!StringUtils.isEmpty(question.getSection())) {
									int qnScore = ((questionpaperqndao
											.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber())))
													.stream().filter(x -> {
														return x.getQuestionbankid() == (question.getQuestionId())
																.intValue();
													}).collect(Collectors.toList())).get(0).getScoreperquestion();
									sectionData.replace(question.getSection(),
											sectionData.get(question.getSection()) + qnScore);
								}
							});
							model.addAttribute("sectionData", sectionData);
						}
					}
				});

				resultModels = resultdao.findByExamId(examId);
				Collections.sort(resultModels, new ResultComparatorUpgrade());
				/*
				 * List<ResultModel> resultModelsOld=resultModels.stream().filter(x->{return
				 * x.getFinalResult().equalsIgnoreCase("no");}).collect(Collectors.toList());
				 * List<ResultModel> resultModelsNew=resultModels.stream().filter(x->{return
				 * x.getFinalResult().equalsIgnoreCase("yes");}).collect(Collectors.toList());
				 */
				List<ResultModel> resultModelsOld = resultModels.stream().filter(x -> {
					return x.getScoreType().equalsIgnoreCase("obtained");
				}).collect(Collectors.toList());
				List<ResultModel> resultModelsNew = resultModels.stream().filter(x -> {
					return x.getScoreType().equalsIgnoreCase("new");
				}).collect(Collectors.toList());

				resultModelsOld.forEach((finalResult) -> {
					totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] + finalResult.getTimeTaken();
					if (finalResult.getStatus().equals("Passed")) {
						candidatesPassed[0] = candidatesPassed[0] + 1;
					}

					// applicantInfo[0] =
					// applicantRegisterDao.findOne(finalResult.getApplicantId());
					// applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
				});
				resultModelsNew.forEach((finalResult) -> {
					// totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] +
					// finalResult.getTimeTaken();
					if (finalResult.getStatus().equals("Passed")) {
						candidatesPassedNew[0] = candidatesPassedNew[0] + 1;
					}

					applicantInfo[0] = applicantRegisterDao.findOne(finalResult.getApplicantId());
					applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
				});

				////////////
				ArrayList<ResultModel> resultModelsNew1 = new ArrayList<ResultModel>();
				Integer pass1 = 0;
				Integer fail1 = 0;
				Long avgTm = new Long(0);
				for (ResultModel r : resultModelsOld) {
					String chk = "false";
					for (ResultModel rN : resultModelsNew) {
						if (rN.getApplicantId().longValue() == r.getApplicantId().longValue()) {
							chk = "true";
							avgTm = avgTm + rN.getTimeTaken();
							if (rN.getStatus().equals("Passed")) {
								pass1 = pass1 + 1;
							}
							if (rN.getStatus().equals("Failed")) {
								fail1 = fail1 + 1;
							}
							resultModelsNew1.add(rN);
						}
					}
					if (chk == "false") {
						avgTm = avgTm + r.getTimeTaken();
						if (r.getStatus().equals("Passed")) {
							pass1 = pass1 + 1;
						}
						if (r.getStatus().equals("Failed")) {
							fail1 = fail1 + 1;
						}
						resultModelsNew1.add(r);
					}

				}

				double passPercentage = ((double) pass1 / (double) resultModelsNew1.size()) * 100;
				model.addAttribute("candidatePassPercentage", passPercentage);

				long averageTimeTaken = 0;
				if (resultModelsNew1.size() > 0) {
					// averageTimeTaken = avgTm / resultModelsNew1.size();
					averageTimeTaken = avgTm / resultModelsOld.size();
				}
				TimeZone tz = TimeZone.getTimeZone("UTC");
				SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
				df.setTimeZone(tz);
				model.addAttribute("averageTimeTaken", df.format(new Date(averageTimeTaken * 1000)));

				model.addAttribute("candidatesPassed", pass1);
				model.addAttribute("candidatesFailed", fail1);

				int i = 0;
				int rank = 0;

				if (resultModelsNew1.size() > 0) {
					resultModelsNew1.get(0).setRank(1);
					while (i < (resultModelsNew1.size() - 1)) {

						if (resultModelsNew1.get(i).getTotalScore() == resultModelsNew1.get(i + 1).getTotalScore()) {
							resultModelsNew1.get(i + 1).setRank(resultModelsNew1.get(i).getRank());
						} else {

							resultModelsNew1.get(i + 1).setRank(resultModelsNew1.get(i).getRank() + 1);
						}
						i = i + 1;
					}
				}

				model.addAttribute("applicantDetails", applicantDetails);
				model.addAttribute("resultsOld", resultModelsOld);
				model.addAttribute("resultsNew", resultModelsNew);
				model.addAttribute("resultsNew1", resultModelsNew1);
				model.addAttribute("noOfCandidates", resultModelsNew1.size());

				QuestionPaperModel questionPaper1 = QuestionPaperDao.findByQuestionpaperid(Long.valueOf(qnpaper));
				for (ResultModel rM : resultModelsNew1) {
					ApplicantRegisterModel applicantM = applicantRegisterDao.findById(rM.getApplicantId());
					Integer maxSC = 0;
					maxSC = sectionData.get(sectionNames.get(1)) + sectionData.get(sectionNames.get(2))
							+ sectionData.get(sectionNames.get(3)) + sectionData.get(sectionNames.get(4));

					Integer obtSc = 0;
					obtSc = rM.getSection1() + rM.getSection2() + rM.getSection3() + rM.getSection4();

					String mailStr = new String();
					mailStr = "";
					Double scoreper = 0.00;
					if (rM.getTotalScore() > questionPaper1.getMaximum_score()) {
						scoreper = 100.00;
					} else {
						scoreper = (new Double(rM.getTotalScore()) / new Double(questionPaper1.getMaximum_score()))
								* 100;
					}

					if (rM.getStatus().equalsIgnoreCase("failed")) {
						mailStr = "Dear " + rM.getApplicantName() + ", ";
						mailStr = mailStr
								+ "<br/> The Corporate Academy  regrets  to inform you that your performance has not come upto the criteria set to pass the  below examination. Your result details are  given below: ";
						mailStr = mailStr + "<br/> ";
					}
					if (rM.getStatus().equalsIgnoreCase("passed")) {
						mailStr = "Dear " + rM.getApplicantName() + ", ";
						mailStr = mailStr
								+ "<br/> <b>Congratulations!</b> 	The Corporate Academy is pleased to inform you that you have passed the below examination. Your Exam/ result details are also given below: ";
						mailStr = mailStr + "<br/> ";
					}
					mailStr = mailStr + "<br/> ";
					mailStr = mailStr + "<table style='width:100%;text-align:left;'>";
					mailStr = mailStr + "<tr>";
					mailStr = mailStr + "  <th colspan='4'>Exam Details</th>";
					mailStr = mailStr + "</tr>";
					mailStr = mailStr + "<tr>";
					mailStr = mailStr + " <td>Name of the Examination: </td>";
					mailStr = mailStr + "<td>" + (examDao.findByExamId(rM.getExamId())).getExamName() + "</td>";
					mailStr = mailStr + "<td>Maximum Score:</td>";
					mailStr = mailStr + "<td>" + questionPaper1.getMaximum_score() + "</td>";
					mailStr = mailStr + "</tr>";
					mailStr = mailStr + "<tr>";
					mailStr = mailStr + "<td>Date of the examination: </td>";
					mailStr = mailStr + "<td>" + rM.getAttendedDate() + "</td>";
					mailStr = mailStr + "<td>Score % required to pass:</td>";
					mailStr = mailStr + "<td>" + questionPaper1.getPass_percentage() + "% </td>";
					mailStr = mailStr + "</tr>";
					mailStr = mailStr + "<tr>";
					mailStr = mailStr + " <td>Exam ID: </td>";
					mailStr = mailStr + " <td>" + rM.getExamId() + "</td>";
					mailStr = mailStr + " <td>Score obtained:</td>";
					mailStr = mailStr + "  <td>" + rM.getTotalScore() + "</td>";
					mailStr = mailStr + "</tr>";
					mailStr = mailStr + " <tr>";
					mailStr = mailStr + "  <td>Result: </td>";
					if (rM.getStatus().equalsIgnoreCase("failed")) {
						mailStr = mailStr + " <td> NOT QUALIFIED </td>";
					} else {
						mailStr = mailStr + " <td>" + rM.getStatus() + "</td>";
					}
					mailStr = mailStr + "<td>Score % obtained:</td>";
					mailStr = mailStr + "<td>" + String.format("%.2f", scoreper) + "% </td>";
					mailStr = mailStr + "</tr>";
					mailStr = mailStr + "</table>";
					mailStr = mailStr + "<br/>";
					mailStr = mailStr + "<table style='width:100%;text-align:left;'>";
					mailStr = mailStr + "<tr>";
					mailStr = mailStr + "<th>Section Score Details:</th>";
					mailStr = mailStr + "<th>Maximum Score </th>";
					mailStr = mailStr + "<th>Score Obtained</th>";
					mailStr = mailStr + "</tr>";
					mailStr = mailStr + "<tr>";
					mailStr = mailStr + "<td>" + sectionNames.get(1) + "</td>";
					mailStr = mailStr + "<td>" + sectionData.get(sectionNames.get(1)) + "</td>";
					mailStr = mailStr + "<td>" + rM.getSection1() + "</td>";
					mailStr = mailStr + "</tr>";
					mailStr = mailStr + "<tr>";
					mailStr = mailStr + "<td>" + sectionNames.get(2) + "</td>";
					mailStr = mailStr + "<td>" + sectionData.get(sectionNames.get(2)) + "</td>";
					mailStr = mailStr + "<td>" + rM.getSection2() + "</td>";
					mailStr = mailStr + "</tr>";
					mailStr = mailStr + "<tr>";
					mailStr = mailStr + "<td>" + sectionNames.get(3) + "</td>";
					mailStr = mailStr + "<td>" + sectionData.get(sectionNames.get(3)) + "</td>";
					mailStr = mailStr + "<td>" + rM.getSection3() + "</td>";
					mailStr = mailStr + "</tr>";
					mailStr = mailStr + "<tr>";
					mailStr = mailStr + "<td>" + sectionNames.get(4) + "</td>";
					mailStr = mailStr + "<td>" + sectionData.get(sectionNames.get(4)) + "</td>";
					mailStr = mailStr + "<td>" + rM.getSection4() + "</td>";
					mailStr = mailStr + "</tr>";
					mailStr = mailStr + "<tr>";
					mailStr = mailStr + "<td>Total:</td>";
					mailStr = mailStr + "<td>" + maxSC + "</td>";
					mailStr = mailStr + "<td>" + obtSc + "</td>";
					mailStr = mailStr + "</tr>";
					mailStr = mailStr + "</table>";

					if (rM.getStatus().equalsIgnoreCase("failed")) {
						mailStr = mailStr + "Please be confident and attempt again.";
						mailStr = mailStr + "<br/> Regards,";
						mailStr = mailStr + "<br/> <b>Corporate Academy, Path Solutions</b>";
						mailStr = mailStr + "<br/> E mail: CorporateAcademy@path-solutions.com";
					}
					if (rM.getStatus().equalsIgnoreCase("passed")) {
						mailStr = mailStr + "Your certificate will be provided shortly.";
						mailStr = mailStr + "<br/> Regards,";
						mailStr = mailStr + "<br/> <b>Corporate Academy, Path Solutions</b>";
						mailStr = mailStr + "<br/> E mail: CorporateAcademy@path-solutions.com";
					}

					final String toEmail = (applicantRegisterDao.findById(rM.getApplicantId())).getEmailId(); // can be
																												// any
																												// email
																												// id

					EmailUtil.sendEmail(getMailSession(), fromEmail, applicantM.getLineManagerEmail(), toEmail,
							"Examination Result", mailStr);
				}

			}

			// model.addAttribute("examList", examList); //// Filter ExamId as the NEW
			// System does not support old exam/result
			List<ResultModel> resultExm = resultdao.findAll();
			HashSet<Object> seen = new HashSet<>();
			resultExm.removeIf(e -> !seen.add(e.getExamId()));
			List<ExamModel> examResLst = new ArrayList<ExamModel>();
			for (ResultModel f : resultExm) {
				examResLst.add(examDao.findByExamId(f.getExamId()));
			}
			examList = examResLst;
			model.addAttribute("examList", examList);
		} catch (Exception e) {
			return e.toString();
		}

		return "Email send successfully.";

	}

	@RequestMapping(value = "/TrainingRptSumm", method = RequestMethod.GET)
	public String TrainingRptSumm(@RequestParam(value = "traId", required = false, defaultValue = "0") String traId,
			Model model) {

		String chk = "false";
		List<EvaluationModel> EvaluationModel = evaluationDao.findByTrainingId(Integer.parseInt(traId));
		if (EvaluationModel.size() > 0) {
			List<TrainingRegstrationModel> TrainingRegstrationModel = TrainingRegisterDao.findByTrainingid(traId)
					.stream().filter(x -> {
						return x.getApprovalStatus().equals("Approved") && x.getAttendance().equalsIgnoreCase("yes");
					}).collect(Collectors.toList());
			List<EvaluationModel> EvaluationModelCnt = evaluationDao.findByTrainingId(Integer.parseInt(traId));
			HashSet<Object> seen = new HashSet<>();
			EvaluationModelCnt.removeIf(e -> !seen.add(e.getTrainingRegistrationId()));
			model.addAttribute("TrainingRegstrationModel", TrainingRegstrationModel);
			model.addAttribute("EvaluationModel", EvaluationModel);
			model.addAttribute("totAttnds", TrainingRegstrationModel.size());
			model.addAttribute("responseRcvd", EvaluationModelCnt.size());
			model.addAttribute("responsePnd", TrainingRegstrationModel.size() - EvaluationModelCnt.size());

			TrainingModel trainingModel = trainingdao.findById(Long.valueOf(traId));
			model.addAttribute("trainingModel", trainingModel);
			// ratings
			List<traheader4Model> traheader4Model = traheader4Dao
					.findByTra2id(Integer.parseInt(trainingModel.getEvalformno()));

			Collections.sort(traheader4Model, new Comparator<traheader4Model>() {
				public int compare(traheader4Model p1, traheader4Model p2) {
					return Long.valueOf(p1.getId()).compareTo(p2.getId());
				}
			});
			List<parameterModel> prmLst = new ArrayList<parameterModel>();
			for (traheader4Model p : traheader4Model) {
				prmLst.add(parameterDao.findById(Long.valueOf(p.getItem())));
			}
			model.addAttribute("prmLst", prmLst);
			// ratings

			traheader1Model traheader1Model = traheader1Dao.findById(Long.valueOf(trainingModel.getEvalformno()));
			List<traheader2Model> traheader2ModelR = traheader2Dao
					.findByTraheaderid(Math.toIntExact(traheader1Model.getId()));
			traheader2ModelR = traheader2ModelR.stream().filter(x -> {
				return x.getAnswertype().equals("Rating");
			}).collect(Collectors.toList());
			List<traheader2Model> traheader2ModelD = traheader2Dao
					.findByTraheaderid(Math.toIntExact(traheader1Model.getId()));
			traheader2ModelD = traheader2ModelD.stream().filter(x -> {
				return x.getAnswertype().equals("descriptive");
			}).collect(Collectors.toList());
			List<traheader3Model> traheader3ModelLst = traheader3Dao.findAll();
			//
			Collections.sort(traheader2ModelR, new Comparator<traheader2Model>() {
				public int compare(traheader2Model p1, traheader2Model p2) {
					return Long.valueOf(p1.getId()).compareTo(p2.getId());
				}
			});
			Collections.sort(traheader2ModelD, new Comparator<traheader2Model>() {
				public int compare(traheader2Model p1, traheader2Model p2) {
					return Long.valueOf(p1.getId()).compareTo(p2.getId());
				}
			});
			Collections.sort(traheader3ModelLst, new Comparator<traheader3Model>() {
				public int compare(traheader3Model p1, traheader3Model p2) {
					return Long.valueOf(p1.getId()).compareTo(p2.getId());
				}
			});
			//
			List<Training> Training = new ArrayList();
			for (traheader2Model tra2 : traheader2ModelR) {
				Integer secCnt = 0;
				Training traS = new Training();
				traS.setId(tra2.getId());
				traS.setName(tra2.getSection());
				traS.setSectionId(0);
				traS.setType("section");
				float avg = 0;
				for (traheader3Model tra3 : traheader3ModelLst) {
					if (Math.toIntExact(tra2.getId()) == tra3.getTra2id()) {
						float val = 0;
						float cnt = 0;
						Training traQ = new Training();
						traQ.setId(tra3.getId());
						traQ.setName(tra3.getQuestion());
						traQ.setSectionId(tra3.getTra2id());
						traQ.setType("question");
						for (EvaluationModel eval : EvaluationModel) {
							if (eval.getQuestionId() == Math.toIntExact(tra3.getId())
									&& eval.getTrainingId() == Math.toIntExact(trainingModel.getId())) {

								if (!StringUtils.isEmpty(eval.getRatingComments())
										&& !eval.getRatingComments().equalsIgnoreCase("0")) {
									cnt = cnt + 1;
									val = val + Integer.parseInt(eval.getRatingComments());
								}
							}
						}
						traQ.setRatings(cnt);
						traQ.setTotScore(val);
						if (val != 0) {
							secCnt = secCnt + 1;
							traQ.setAvgScore(val / cnt);
						} else {
							traQ.setAvgScore(0);
						}
						avg = avg + traQ.getAvgScore();
						Training.add(traQ);
					}
				}
				if (secCnt != 0) {
					traS.setAvgScore(avg / secCnt);
				} else {
					traS.setAvgScore(avg);
				}
				Training.add(traS);
			}
			model.addAttribute("traheader2ModelD", traheader2ModelD);
			model.addAttribute("traheader3ModelLst", traheader3ModelLst);
			model.addAttribute("Training", Training);
		} else {
			chk = "true";
		}
		model.addAttribute("chk", chk);
		List<TrainingModel> trainingLst = trainingdao.findAll();
		model.addAttribute("trainingLst", trainingLst);

		if (viewController.validatePageAccess("/EvaluationRpt")) {

			return "TrainingRptSumm";

		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/TrainingRptEv", method = RequestMethod.GET)
	public String TrainingRptEv(@RequestParam(value = "traId", required = false, defaultValue = "0") String traId,
			Model model) {
		String chkEval = "false";
		List<EvaluationModel> EvaluationModel = evaluationDao.findByTrainingId(Integer.parseInt(traId));
		if (EvaluationModel.size() > 0) {
			List<TrainingRegstrationModel> TrainingRegstrationModel = TrainingRegisterDao.findByTrainingid(traId)
					.stream().filter(x -> {
						return x.getApprovalStatus().equals("Approved") && x.getAttendance().equalsIgnoreCase("yes");
					}).collect(Collectors.toList());
			List<EvaluationModel> EvaluationModelCnt = evaluationDao.findByTrainingId(Integer.parseInt(traId));
			HashSet<Object> seen = new HashSet<>();
			EvaluationModelCnt.removeIf(e -> !seen.add(e.getTrainingRegistrationId()));
			model.addAttribute("TrainingRegstrationModel", TrainingRegstrationModel);
			model.addAttribute("EvaluationModel", EvaluationModel);
			model.addAttribute("totAttnds", TrainingRegstrationModel.size());
			model.addAttribute("responseRcvd", EvaluationModelCnt.size());
			model.addAttribute("responsePnd", TrainingRegstrationModel.size() - EvaluationModelCnt.size());
			TrainingModel trainingModel = trainingdao.findById(Long.valueOf(traId));
			model.addAttribute("trainingModel", trainingModel);
		} else {
			chkEval = "true";
		}

		model.addAttribute("chkEval", chkEval);
		List<TrainingModel> trainingLst = trainingdao.findAll();
		model.addAttribute("trainingLst", trainingLst);

		if (viewController.validatePageAccess("/EvaluationRpt")) {

			return "TrainingRptEv";

		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/TrainingRptIndv", method = RequestMethod.GET)
	public String TrainingRptIndv(@RequestParam(value = "traId", required = false, defaultValue = "0") String traId,
			@RequestParam(value = "traRegId", required = false, defaultValue = "0") String traRegId, Model model) {
		List<TrainingRegstrationModel> TrainingRegstrationModel = TrainingRegisterDao
				.findByIdAndTrainingid(Long.valueOf(traRegId), traId);// .stream().filter(x->{return
																		// x.getApprovalStatus().equals("Approved");}).collect(Collectors.toList());
		List<EvaluationModel> EvaluationModel = evaluationDao
				.findByTrainingIdAndTrainingRegistrationId(Integer.parseInt(traId), Integer.parseInt(traRegId));
		TrainingModel trainingModel = trainingdao.findById(Long.valueOf(traId));
		traheader1Model traheader1Model = traheader1Dao.findById(Long.valueOf(trainingModel.getEvalformno()));
		List<traheader2Model> traheader2Model = traheader2Dao
				.findByTraheaderid(Math.toIntExact(traheader1Model.getId()));
		List<traheader3Model> traheader3Model = traheader3Dao.findAll();
		List<traheader4Model> traheader4Model = traheader4Dao
				.findByTra2id(Integer.parseInt(trainingModel.getEvalformno()));

		Collections.sort(traheader3Model, new Comparator<traheader3Model>() {
			public int compare(traheader3Model p1, traheader3Model p2) {
				return Long.valueOf(p1.getId()).compareTo(p2.getId());
			}
		});

		model.addAttribute("TrainingRegstrationModel", TrainingRegstrationModel);
		model.addAttribute("EvaluationModel", EvaluationModel);
		model.addAttribute("trainingModel", trainingModel);
		model.addAttribute("traheader1Model", traheader1Model);
		model.addAttribute("traheader2Model", traheader2Model);
		model.addAttribute("traheader3Model", traheader3Model);
		model.addAttribute("traheader4Model", traheader4Model);
		List<TrainingModel> trainingLst = trainingdao.findAll();
		model.addAttribute("trainingLst", trainingLst);

		if (viewController.validatePageAccess("/EvaluationRpt")) {

			return "TrainingRptIndv";

		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/TrainingRptExp", method = RequestMethod.GET)
	public String TrainingRptExp(@RequestParam(value = "traId", required = false, defaultValue = "0") String traId,
			Model model) {

		List<EvaluationModel> EvaluationModel = evaluationDao.findByTrainingId(Integer.parseInt(traId));

		List<TrainingRegstrationModel> TrainingRegstrationModel = TrainingRegisterDao.findByTrainingid(traId).stream()
				.filter(x -> {
					return x.getApprovalStatus().equals("Approved");
				}).collect(Collectors.toList());
		TrainingModel trainingModel = trainingdao.findById(Long.valueOf(traId));
		traheader1Model traheader1Model = traheader1Dao.findById(Long.valueOf(trainingModel.getEvalformno()));
		List<traheader2Model> traheader2Model = traheader2Dao
				.findByTraheaderid(Math.toIntExact(traheader1Model.getId()));
		List<traheader3Model> traheader3Model = traheader3Dao.findAll();
		List<traheader4Model> traheader4Model = traheader4Dao
				.findByTra2id(Integer.parseInt(trainingModel.getEvalformno()));

		model.addAttribute("TrainingRegstrationModel", TrainingRegstrationModel);
		model.addAttribute("EvaluationModel", EvaluationModel);
		model.addAttribute("trainingModel", trainingModel);
		model.addAttribute("traheader1Model", traheader1Model);
		model.addAttribute("traheader2Model", traheader2Model);
		model.addAttribute("traheader3Model", traheader3Model);
		model.addAttribute("traheader4Model", traheader4Model);

		Collections.sort(traheader4Model, new Comparator<traheader4Model>() {
			public int compare(traheader4Model p1, traheader4Model p2) {
				return Long.valueOf(p1.getId()).compareTo(p2.getId());
			}
		});
		List<parameterModel> prmLst = new ArrayList<parameterModel>();
		for (traheader4Model p : traheader4Model) {
			prmLst.add(parameterDao.findById(Long.valueOf(p.getItem())));
		}
		model.addAttribute("prmLst", prmLst);

		if (viewController.validatePageAccess("/EvaluationRpt")) {

			return "TrainingRptExp";
		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/TrainingEvaluation", method = RequestMethod.GET)
	public String TrainingEvaluation(@RequestParam(value = "traId", required = false, defaultValue = "0") String traId,
			@RequestParam(value = "traRegId", required = false, defaultValue = "0") String traRegId, Model model) {
		String submitted = "false";
		String message = "";
		String submitdt = "false";
		Date dateInDB = null;
		Date dbdate = null;
		Date currentDate = new Date();
		// DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		try {
			if (traId != "0") {
				TrainingModel trainingModel = trainingdao.findById(Long.valueOf(traId));
				model.addAttribute("trainingModel", trainingModel);
				dbdate = new SimpleDateFormat("yyyy-MM-dd").parse(trainingModel.getRegfinal());
				List<TrainingRegstrationModel> TrainingRegstrationModel = TrainingRegisterDao
						.findByIdAndTrainingid(Long.valueOf(traRegId), traId);

				// if (dbdate.compareTo(currentDate) <= 0){
				// submitted="true";
				// message="The final date to submit the Training Evaluation was on "
				// +dateFormat.format(currentDate); ;
				// }else{
				if (TrainingRegstrationModel.size() > 0) {
					if (traRegId != "0"
							&& TrainingRegstrationModel.get(0).getApprovalStatus().equalsIgnoreCase("Approved")) {
						if (evaluationDao.findByTrainingIdAndTrainingRegistrationId(Integer.parseInt(traId),
								Integer.parseInt(traRegId)).size() > 0) {
							submitted = "true";
							message = "The user has submitted the Training Evaluation.";
						} else {

							//// Last date of submission over
							if (trainingModel.getSubmitdate() != null) {
								Date datesub = new SimpleDateFormat("yyyy-MM-dd").parse(trainingModel.getSubmitdate());
								if (currentDate.compareTo(datesub) > 0) {
									submitdt = "true";
									message = "Last date of submission is over.";
								}
							}
							////
							model.addAttribute("YourName", TrainingRegstrationModel.get(0).getCandidateName());
							Integer trId = Integer.parseInt(traId);
							if (trId > 0) {
								traheader1Model traheader1Model = traheader1Dao
										.findById(Long.valueOf(trainingModel.getEvalformno()));
								List<traheader2Model> traheader2Model = traheader2Dao
										.findByTraheaderid(Math.toIntExact(traheader1Model.getId()));
								List<traheader3Model> traheader3Model = traheader3Dao.findAll();
								List<traheader4Model> traheader4Model = traheader4Dao
										.findByTra2id(Integer.parseInt(trainingModel.getEvalformno()));
								Collections.sort(traheader2Model, new Comparator<traheader2Model>() {
									public int compare(traheader2Model p1, traheader2Model p2) {
										return Long.valueOf(p1.getId()).compareTo(p2.getId());
									}
								});
								Collections.sort(traheader3Model, new Comparator<traheader3Model>() {
									public int compare(traheader3Model p1, traheader3Model p2) {
										return Long.valueOf(p1.getId()).compareTo(p2.getId());
									}
								});
								Collections.sort(traheader4Model, new Comparator<traheader4Model>() {
									public int compare(traheader4Model p1, traheader4Model p2) {
										return Long.valueOf(p1.getId()).compareTo(p2.getId());
									}
								});
								model.addAttribute("traheader1Model", traheader1Model);
								model.addAttribute("traheader2Model", traheader2Model);
								model.addAttribute("traheader3Model", traheader3Model);
								model.addAttribute("traheader4Model", traheader4Model);

								List<parameterModel> paramList = parameterDao.findAll();
								paramList = paramList.stream().filter(x -> {
									return x.getPrm_type().equalsIgnoreCase("Training Evaluation");
								}).collect(Collectors.toList());
								model.addAttribute("paramList", paramList);
								model.addAttribute("traId", traId);

							}
						}
					} else {
						submitted = "true";
						message = "The page does not exists";
					}
				} else {
					submitted = "true";
					message = "The page does not exists";

				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			submitted = "true";
			message = "The page does not exists";
		}
		model.addAttribute("submitted", submitted);
		model.addAttribute("submitdt", submitdt);
		model.addAttribute("message", message);
		model.addAttribute("traId", traId);
		model.addAttribute("traRegId", traRegId);

		return "TrainingEvaluation";
	}

	@RequestMapping(value = "/submitTrainingEvaluation", method = RequestMethod.POST)
	public @ResponseBody String submitTrainingEvaluation(
			@RequestParam(value = "trainingRegId", required = false) String trainingRegId,
			@RequestParam(value = "trainingId", required = false) String trainingId,
			@RequestParam(value = "questId", required = false) String questId,
			@RequestParam(value = "comment", required = false) String comment, Model model) {

		try {
			EvaluationModel evaluationModel = new EvaluationModel();
			evaluationModel.setTrainingRegistrationId(Integer.parseInt(trainingRegId));
			evaluationModel.setTrainingId(Integer.parseInt(trainingId));
			evaluationModel.setQuestionId(Integer.parseInt(questId));
			evaluationModel.setRatingComments(comment);
			evaluationDao.save(evaluationModel);

			return "success";

		} catch (Exception e) {
			return "Failed";
		}

	}

	@RequestMapping(value = "/TrainingEvalView", method = RequestMethod.GET)
	public String TrainingEvalView(@RequestParam(value = "traId", required = false, defaultValue = "0") String traId,
			Model model) {
		String del = "false";
		try {
			String frmActv = "false";

			Integer trId = Integer.parseInt(traId);
			if (trId > 0) {
				traheader1Model traheader1Model = traheader1Dao.findById(Long.valueOf(traId));
				List<traheader2Model> traheader2Model = traheader2Dao
						.findByTraheaderid(Math.toIntExact(traheader1Model.getId()));
				List<traheader3Model> traheader3Model = traheader3Dao.findAll();
				List<traheader4Model> traheader4Model = traheader4Dao.findByTra2id(Integer.parseInt(traId));
				Collections.sort(traheader2Model, new Comparator<traheader2Model>() {
					public int compare(traheader2Model p1, traheader2Model p2) {
						return Long.valueOf(p1.getId()).compareTo(p2.getId());
					}
				});
				Collections.sort(traheader3Model, new Comparator<traheader3Model>() {
					public int compare(traheader3Model p1, traheader3Model p2) {
						return Long.valueOf(p1.getId()).compareTo(p2.getId());
					}
				});
				Collections.sort(traheader4Model, new Comparator<traheader4Model>() {
					public int compare(traheader4Model p1, traheader4Model p2) {
						return Long.valueOf(p1.getId()).compareTo(p2.getId());
					}
				});
				model.addAttribute("traheader1Model", traheader1Model);
				model.addAttribute("traheader2Model", traheader2Model);
				model.addAttribute("traheader3Model", traheader3Model);
				model.addAttribute("traheader4Model", traheader4Model);

				List<TrainingModel> TrainingModelLst = trainingdao.findByEvalformno(traId);
				for (TrainingModel tra : TrainingModelLst) {
					List<EvaluationModel> EvaluationModelLst = evaluationDao
							.findByTrainingId(Math.toIntExact(tra.getId()));
					if (EvaluationModelLst.size() > 0) {
						del = "true";
					}
				}
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		List<parameterModel> paramList = parameterDao.findAll();
		paramList = paramList.stream().filter(x -> {
			return x.getPrm_type().equalsIgnoreCase("Training Evaluation");
		}).collect(Collectors.toList());
		model.addAttribute("paramList", paramList);

		model.addAttribute("del", del);
		model.addAttribute("traId", traId);
		List<traheader1Model> trainingLst = traheader1Dao.findAll();
		model.addAttribute("trainingLst", trainingLst);

		if (viewController.validatePageAccess("/EvaluvationSetup")) {

			return "TrainingEvalView";

		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/createTrainingFrm", method = RequestMethod.POST) // for Evaluvation setup
	public @ResponseBody String createTrainingFrm(@RequestParam(value = "traName", required = false) String traName,
			@RequestParam(value = "traDtls", required = false) String traDtls,
			@RequestParam(value = "rating1", required = false) String rating1,
			@RequestParam(value = "rating2", required = false) String rating2,
			@RequestParam(value = "rating3", required = false) String rating3,
			@RequestParam(value = "rating4", required = false) String rating4,
			@RequestParam(value = "rating5", required = false) String rating5,
			@RequestParam(value = "rating6", required = false) String rating6,
			@RequestParam(value = "section", required = false) String section, Model model) {

		try {
			traheader1Model traheader1Model = new traheader1Model();
			traheader1Model.setFormName(traName);
			traheader1Model.setDetails(traDtls);
			traheader1Dao.save(traheader1Model);

			if (rating1 != "") {
				parameterModel prmMdl1 = parameterDao.findById(Long.valueOf(rating1));
				prmMdl1.setPrm_status("Active");
				parameterDao.save(prmMdl1);
				traheader4Model traheader4Model1 = new traheader4Model();
				traheader4Model1.setItem(rating1);
				traheader4Model1.setTra2id(Math.toIntExact(traheader1Model.getId()));
				traheader4Dao.save(traheader4Model1);
			}
			if (rating2 != "") {
				parameterModel prmMdl2 = parameterDao.findById(Long.valueOf(rating2));
				prmMdl2.setPrm_status("Active");
				parameterDao.save(prmMdl2);
				traheader4Model traheader4Model2 = new traheader4Model();
				traheader4Model2.setItem(rating2);
				traheader4Model2.setTra2id(Math.toIntExact(traheader1Model.getId()));
				traheader4Dao.save(traheader4Model2);
			}
			if (rating3 != "") {
				parameterModel prmMdl3 = parameterDao.findById(Long.valueOf(rating3));
				prmMdl3.setPrm_status("Active");
				parameterDao.save(prmMdl3);
				traheader4Model traheader4Model3 = new traheader4Model();
				traheader4Model3.setItem(rating3);
				traheader4Model3.setTra2id(Math.toIntExact(traheader1Model.getId()));
				traheader4Dao.save(traheader4Model3);
			}
			if (rating4 != "") {
				parameterModel prmMdl4 = parameterDao.findById(Long.valueOf(rating4));
				prmMdl4.setPrm_status("Active");
				parameterDao.save(prmMdl4);
				traheader4Model traheader4Model4 = new traheader4Model();
				traheader4Model4.setItem(rating4);
				traheader4Model4.setTra2id(Math.toIntExact(traheader1Model.getId()));
				traheader4Dao.save(traheader4Model4);
			}
			if (rating5 != "") {
				parameterModel prmMdl5 = parameterDao.findById(Long.valueOf(rating5));
				prmMdl5.setPrm_status("Active");
				parameterDao.save(prmMdl5);
				traheader4Model traheader4Model5 = new traheader4Model();
				traheader4Model5.setItem(rating5);
				traheader4Model5.setTra2id(Math.toIntExact(traheader1Model.getId()));
				traheader4Dao.save(traheader4Model5);
			}
			if (rating6 != "") {
				parameterModel prmMdl6 = parameterDao.findById(Long.valueOf(rating6));
				prmMdl6.setPrm_status("Active");
				parameterDao.save(prmMdl6);
				traheader4Model traheader4Model6 = new traheader4Model();
				traheader4Model6.setItem(rating6);
				traheader4Model6.setTra2id(Math.toIntExact(traheader1Model.getId()));
				traheader4Dao.save(traheader4Model6);
			}
			return traheader1Model.getId().toString();
		} catch (Exception e) {
			return "Failed";
		}

	}

	@RequestMapping(value = "/delTrainingFrm", method = RequestMethod.POST) // for Evaluvation setup
	public @ResponseBody String delTrainingFrm(@RequestParam(value = "traId", required = false) String traId,
			Model model) {
		try {
			List<traheader2Model> traheader2Model = traheader2Dao.findByTraheaderid(Integer.parseInt(traId));
			traheader2Model.forEach(x -> traheader3Dao.deleteByTra2id(Math.toIntExact(x.getId())));
			traheader2Dao.deleteByTraheaderid(Integer.parseInt(traId));
			traheader4Dao.deleteByTra2id(Integer.parseInt(traId));
			traheader1Dao.deleteById(Long.valueOf(traId));
			return "success";
		} catch (Exception e) {
			return "Failed";
		}
	}

	@RequestMapping(value = "/addTrainingSec", method = RequestMethod.POST) // for Evaluvation setup
	public @ResponseBody String addTrainingSec(@RequestParam(value = "traId", required = false) String traId,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "rating", required = false) String rating, Model model) {

		try {

			traheader2Model traheader2Model = new traheader2Model();

			traheader2Model.setTraheaderid(Integer.parseInt(traId));
			traheader2Model.setSection(section);
			traheader2Model.setAnswertype(rating);
			traheader2Dao.save(traheader2Model);
			return traId;
		} catch (Exception e) {
			return "Failed";
		}

	}

	@RequestMapping(value = "/addTrainingQn", method = RequestMethod.POST) // for Evaluvation setup
	public @ResponseBody String addTrainingQn(@RequestParam(value = "traId", required = false) String traId,
			@RequestParam(value = "secId", required = false) String secId,
			@RequestParam(value = "quest", required = false) String quest, Model model) {

		try {
			traheader2Model traheader2Model = traheader2Dao.findById(Long.valueOf(secId));

			if (traheader2Model != null) {
				traheader3Model traheader3Model = new traheader3Model();
				traheader3Model.setTra2id(Integer.parseInt(secId));
				traheader3Model.setQuestion(quest);
				traheader3Dao.save(traheader3Model);
				return traId;
			}
			return "0";
		} catch (Exception e) {
			return "Failed";
		}

	}

	@RequestMapping(value = "/delTrainingSec", method = RequestMethod.POST) // for Evaluvation setup
	public @ResponseBody String delTrainingSec(@RequestParam(value = "traId", required = false) String traId,
			@RequestParam(value = "secId", required = false) String secId, Model model) {
		try {
			traheader3Dao.deleteByTra2id(Integer.parseInt(secId));
			traheader2Dao.deleteById(Long.valueOf(secId));
			return traId;
		} catch (Exception e) {
			return "Failed";
		}
	}

	@RequestMapping(value = "/delTrainingQn", method = RequestMethod.POST) // for Evaluvation setup
	public @ResponseBody String delTrainingQn(@RequestParam(value = "traId", required = false) String traId,
			@RequestParam(value = "qnId", required = false) String qnId, Model model) {
		try {
			traheader3Dao.deleteById(Long.valueOf(qnId));

			return traId;
		} catch (Exception e) {
			return "Failed";
		}
	}

	@RequestMapping(value = "/trainingDetails", method = RequestMethod.GET)
	public String viewTrainingDetails(@RequestParam(value = "traingid") String traingid, Model model) {

		TrainingModel trainingList = trainingdao.findById(Long.valueOf(traingid));

		model.addAttribute("trainingList", trainingList);
		//
		String reglink = "enable";
		try {
			Date regdt = new SimpleDateFormat("yyyy-MM-dd").parse(trainingList.getRegfinal());
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date today = new Date();
			Date todaydt = formatter.parse(formatter.format(today));
			if (todaydt.compareTo(regdt) > 0) {
				reglink = "disable";
			}

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("reglink", reglink);
		//

		return "display_tra_details";

	}

	/* ----- */

	@RequestMapping(value = "/endTraining", method = RequestMethod.GET)
	public String endTraining() {

		return "endTraining";
	}

	@RequestMapping(value = "/TrainingModule", method = RequestMethod.GET) // for Training module home page
	public String TrainingModule(Model model) {

		return "TrainingModule";
	}

	@RequestMapping(value = "/TrainingAnnouncementjsp", method = RequestMethod.GET) // for training announcement
	public String TrainingAnnouncementjsp(Model model) {

		List<parameterModel> paramList = parameterDao.findAll();
		// Collections.reverse(paramList);
		model.addAttribute("paramList", paramList);

		List<traheader1Model> formid = traheader1Dao.findAll();
		model.addAttribute("formid", formid);

		if (viewController.validatePageAccess("/TrainingAnnouncementjsp")) {

			return "TrainingAnnouncementjsp";

		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/Trainingdata", method = RequestMethod.POST) // for training announcement add page
	public @ResponseBody String Trainingdata(@RequestParam(value = "traingid", required = false) Long traingid,
			Model model, TrainingModel trainingmodel) {

		try {

			if (!StringUtils.isEmpty(traingid)) {
				TrainingModel updateaddModel = trainingdao.getOne(Long.valueOf(traingid));
				updateaddModel.setTrainingtype(trainingmodel.getTrainingtype());
				updateaddModel.setName(trainingmodel.getName());
				updateaddModel.setPeriod(trainingmodel.getPeriod());
				updateaddModel.setLanguage(trainingmodel.getLanguage());
				updateaddModel.setLocation(trainingmodel.getLocation());
				updateaddModel.setRegfinal(trainingmodel.getRegfinal());
				updateaddModel.setStartdt(trainingmodel.getStartdt());
				updateaddModel.setDetails(trainingmodel.getDetails());
				updateaddModel.setWhocan(trainingmodel.getWhocan());
				updateaddModel.setOtherdeatils(trainingmodel.getOtherdeatils());
				updateaddModel.setTrainername(trainingmodel.getTrainername());
				updateaddModel.setDepartment(trainingmodel.getDepartment());
				updateaddModel.setCategory(trainingmodel.getCategory());
				updateaddModel.setEvalformno(trainingmodel.getEvalformno());
				updateaddModel.setSubmitdate(trainingmodel.getSubmitdate());
				updateaddModel.setTimezone(trainingmodel.getTimezone());
				updateaddModel.setAgenda(trainingmodel.getAgenda());
				trainingdao.save(updateaddModel);
			} else {
				parameterModel prm = parameterDao.findById(trainingmodel.getCategory());
				prm.setPrm_status("Active");
				parameterDao.save(prm);
				trainingdao.save(trainingmodel);
			}
		} catch (Exception e) {
		}

		return "sucess";
	}

	@RequestMapping(value = "/Trainingview", method = RequestMethod.GET) // for view training details
	public String examsview(@RequestParam(value = "examid", required = false) String examId, Model model) {

		List<TrainingModel> trainingList = trainingdao.findAll();
		Collections.reverse(trainingList);
		model.addAttribute("trainingList", trainingList);

		if (viewController.validatePageAccess("/Trainingview")) {

			return "Trainingview";
		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/TrainingLink", method = RequestMethod.GET) // for view training details
	public String TrainingLink(@RequestParam(value = "examid", required = false) String examId, Model model) {

		List<TrainingModel> trainingList = trainingdao.findAll();
		Collections.reverse(trainingList);
		model.addAttribute("trainingList", trainingList);

		if (viewController.validatePageAccess("/TrainingLink")) {

			return "TrainingLink";
		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/TraingAnnounceEdit", method = RequestMethod.GET) // for view training details
	public String TraingAnnounceEdit(@RequestParam(value = "traingid", required = false) Long traingid, Model model) {

		TrainingModel trainingList = trainingdao.findById(traingid);

		model.addAttribute("trainingList", trainingList);

		return "TraingAnnounceEdit";

	}

	@RequestMapping(value = "/TrainingRegistration", method = RequestMethod.GET) // for training announcement
	public String TrainingRegistration(@RequestParam(value = "traingid", required = false) Long traingid, Model model) {

		TrainingModel trainingList = trainingdao.findById(traingid);

		model.addAttribute("trainingList", trainingList.getName());
		model.addAttribute("traid", trainingList.getId());

		return "TrainingRegistration";
	}

	@RequestMapping(value = "/TrainingRegistrationedit", method = RequestMethod.GET) // for training announcement
	public String TrainingRegistrationedit(
			@RequestParam(value = "traingapplicantid", required = false) String traingapplicantid, Model model) {

		TrainingRegstrationModel trainingReg = TrainingRegisterDao.findById(Long.valueOf(traingapplicantid));
		model.addAttribute("applicant", trainingReg);
		// TrainingModel trainingList=trainingdao.findById(traingid);
		TrainingModel trainingList = trainingdao.findById(Long.valueOf(trainingReg.getTrainingid()));
		model.addAttribute("trainingList", trainingList.getName());
		model.addAttribute("traid", trainingList.getId());

		String str = trainingReg.getServiceDuration();
		String[] arrOfStr = str.split(" ");
		String years = "", months = "";
		if (str != "" && arrOfStr.length > 1) {
			years = arrOfStr[0].substring(0, arrOfStr[0].length() - 5);
			months = arrOfStr[2].substring(0, arrOfStr[2].length() - 6);
		}
		// for (String a : arrOfStr)
		// System.out.println(a);
		model.addAttribute("years", years);
		model.addAttribute("months", months);

		// return "TrainingRegistration_edit";
		if (viewController.validatePageAccess("/TraingApplnt")) {

			return "TrainingRegistration_edit";

		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/registerTrainingApplicant", method = RequestMethod.POST)
	public @ResponseBody String registerApplicant(TrainingRegstrationModel TrainingRegstrationModel) {

		try {
			TrainingRegstrationModel.setCurrentdate((new Date()).toString());

			TrainingRegisterDao.save(TrainingRegstrationModel);

			return "success";
		} catch (Exception e) {
			return "failed";
		}

	}

	@RequestMapping(value = "/registerTrainingApplicantedit", method = RequestMethod.POST)
	public @ResponseBody String registerApplicantedit(TrainingRegstrationModel TrainingRegstrationModel) {

		try {
			TrainingRegstrationModel.setApprovalStatus(
					TrainingRegisterDao.findById(TrainingRegstrationModel.getId()).getApprovalStatus());
			TrainingRegisterDao.save(TrainingRegstrationModel);

			return TrainingRegstrationModel.getTrainingid();
		} catch (Exception e) {
			return "failed";
		}

	}

	@RequestMapping(value = "/ViewTrainingApplicant", method = RequestMethod.GET) // for view training details
	public String ViewTrainingApplicant(@RequestParam(value = "traingid", required = false) String traingid,
			Model model) {
		List<TrainingRegstrationModel> trainingList = null;
		TrainingModel paList = null;
		List<TrainingModel> paramList = trainingdao.findAll();

		model.addAttribute("paramList", paramList);

		if (!StringUtils.isEmpty(traingid)) {
			trainingList = TrainingRegisterDao.findByTrainingid(traingid);
			paList = trainingdao.findById(Long.valueOf(traingid));
		}
		model.addAttribute("applicantList", trainingList);
		model.addAttribute("TrainingName", paList.getName());
		model.addAttribute("TrainingLocation", paList.getLocation());
		model.addAttribute("TrainingType", paList.getTrainingtype());
		model.addAttribute("TrainingStartdt", paList.getStartdt());
		model.addAttribute("TrainingID", paList.getId());

		return "ViewTrainingApplicant";

	}

	@RequestMapping(value = "/TraingApplnt", method = RequestMethod.GET) // for view training details
	public String TraingApplnt(@RequestParam(value = "traingid", required = false) String traingid, Model model) {

		List<TrainingModel> paramList = trainingdao.findAll();

		model.addAttribute("paramList", paramList);

		if (viewController.validatePageAccess("/TraingApplnt")) {

			return "TraingApplnt";
		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/approvetrainingApplicants", method = RequestMethod.POST)
	public @ResponseBody String approveApplicants(@RequestBody ApplicantManagerPOJO[] applicantsList) {

		int i = 0;
		if (applicantsList != null) {
			while (i < applicantsList.length) {

				TrainingRegisterDao.setStatusForApplicant(applicantsList[i].getStatus(),
						applicantsList[i].getApplicantId());

				// System.out.println(applicantsList[i].getApplicantId());

				i++;
			}
		}

		return "success";
	}

	@RequestMapping(value = "/Markattendence", method = RequestMethod.GET) // for view training details
	public String Markattendence(@RequestParam(value = "traingid", required = false) String traingid, Model model) {

		List<TrainingModel> paramList = trainingdao.findAll();
		List<TrainingRegstrationModel> traRegister = TrainingRegisterDao.findAll();
		model.addAttribute("paramList", paramList);
		TrainingModel paList = null;
		if (!StringUtils.isEmpty(traingid)) {

			paList = trainingdao.findById(Long.valueOf(traingid));

			traRegister = traRegister.stream() // converting the list to stream
					.filter(str -> str.getTrainingid().equals(traingid) && str.getApprovalStatus().equals("Approved")) // filter
																														// the
																														// stream
																														// to
																														// create
																														// a
																														// new
																														// stream

					.collect(Collectors.toList()); // collect the final stream and convert it to a List
			model.addAttribute("applicantList", traRegister);
		}

		List<EvaluationModel> evalLst = evaluationDao.findAll();
		HashSet<Object> seen = new HashSet<>();
		evalLst.removeIf(e -> !seen.add(e.getTrainingRegistrationId()));
		List<String> evalLstS = new ArrayList<String>();
		evalLst.forEach(x -> evalLstS.add(String.valueOf(x.getTrainingRegistrationId())));
		model.addAttribute("Traininglist", paList);
		model.addAttribute("evalLstS", evalLstS);

		if (viewController.validatePageAccess("/Markattendence")) {

			return "Markattendence";
		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/checkattandance", method = RequestMethod.GET) // for mark attendance
	public String checkattandance(@RequestParam(value = "userId", required = false) Long userId, Model model) {

		try {
			if (!StringUtils.isEmpty(userId)) {

				TrainingRegstrationModel updateaddModel = TrainingRegisterDao.findById(userId);

				if (updateaddModel.getAttendance().equalsIgnoreCase("Yes")) {

					updateaddModel.setAttendance("No");

					TrainingRegisterDao.save(updateaddModel);
				} else {
					updateaddModel.setAttendance("Yes");

					TrainingRegisterDao.save(updateaddModel);
				}

			}

		}

		catch (Exception e) {
			return "failed";
		}
		return "sucess";

	}

	@RequestMapping(value = "/EvaluvationSetup", method = RequestMethod.GET) // for Evaluvation setup
	public String EvaluvationSetup(@RequestParam(value = "traingid", required = false) String traingid, Model model) {

		List<parameterModel> paramList = parameterDao.findAll();
		// System.out.println(paramList);
		model.addAttribute("paramList", paramList);

		if (viewController.validatePageAccess("/EvaluvationSetup")) {

			return "EvaluvationSetup";
		} else {
			return "no_access";
		}

	}

	@RequestMapping(value = "/Evalupload", method = RequestMethod.POST) // for Evaluvation setup
	public @ResponseBody String Evalupload(@RequestParam(value = "formName", required = false) String formName,
			@RequestParam(value = "Details", required = false) String Details,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "answertype", required = false) String answertype, Model model) {
		int i = 0;
		traheader1Model traheader1Model = null;
		try {
			if (formName != null && Details != null) {
				traheader1Model = new traheader1Model();
				traheader1Model.setFormName(formName);
				traheader1Model.setDetails(Details);
				traheader1Dao.save(traheader1Model); // for save formname and details

			}

		} catch (Exception e) {
			return "failed";
		}
		return "sucess";
	}

	@RequestMapping(value = "/Evalsectionupload", method = RequestMethod.POST) // for Evaluvation setup
	public @ResponseBody String Evalsectionupload(@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "answertype", required = false) String answertype,
			@RequestParam(value = "ScreenId", required = false) String[] ScreenId, Model model) {
		Integer i = 0;
		List<traheader1Model> traheader1Model = traheader1Dao.findAll();
		try {
			ArrayList<Long> arr = new ArrayList<Long>();
			traheader1Model.forEach(screen -> {
				arr.add(screen.getId());

			});
			Long lastElement = null;
			int tra2id = 0;
			if (section != null && answertype != null) {
				traheader2Model traheader2Model = new traheader2Model();
				lastElement = arr.get(arr.size() - 1);
				// System.out.println(lastElement);
				i = (int) (long) lastElement;
				traheader2Model.setTraheaderid(i);
				traheader2Model.setSection(section);
				traheader2Model.setAnswertype(answertype);
				traheader2Dao.save(traheader2Model); // for save section,answertype and and id from trainingheader1
														// table
				long l = traheader2Model.getId();
				tra2id = (int) l;
			}

			for (String str : ScreenId) {

				int sid = Integer.parseInt(str);
				// System.out.println(sid);
				traheader4Model traheader4Model = new traheader4Model();
				traheader4Model.setItem(str);
				traheader4Model.setTra2id(tra2id);
				traheader4Dao.save(traheader4Model);
			}

		}

		catch (Exception e) {
			return "failed";
		}
		return "sucess";
	}

	@RequestMapping(value = "/EvalQuestions", method = RequestMethod.POST) // for Evaluvation setup
	public @ResponseBody String EvalQuestions(Model model,
			@RequestParam(value = "question", required = false) String question) {

		Integer i = 0;
		List<traheader2Model> traheader2Model = traheader2Dao.findAll();
		try {
			ArrayList<Long> arr = new ArrayList<Long>();
			traheader2Model.forEach(screen -> {
				arr.add(screen.getId());

			});
			Long lastElement = null;
			lastElement = arr.get(arr.size() - 1);
			i = (int) (long) lastElement;

			traheader3Model traheader3Model = new traheader3Model();
			traheader3Model.setTra2id(i);
			traheader3Model.setQuestion(question);
			traheader3Dao.save(traheader3Model);

		}

		catch (Exception e) {
			return "failed";
		}

		return "sucess";

	}

	@RequestMapping(value = "/EvalnextSection", method = RequestMethod.POST) // for Evaluvation setup
	public @ResponseBody String EvalnextSection(Model model,
			@RequestParam(value = " RatingId", required = false) String[] RatingId,
			@RequestParam(value = "question", required = false) String question,
			@RequestParam(value = "sect", required = false) String sect,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "answertype", required = false) String answertype,
			@RequestParam(value = "responsetype", required = false) String responsetype) {

		Integer i = 0;
		Integer k = 0;
		int tra2id = 0;
		List<traheader1Model> traheader1Model = traheader1Dao.findAll();
		try {
			ArrayList<Long> arr = new ArrayList<Long>();
			traheader1Model.forEach(screen -> {
				arr.add(screen.getId());

			});
			Long lastElement = null;
			lastElement = arr.get(arr.size() - 1);
			i = (int) (long) lastElement;

			List<traheader2Model> tra2Model = traheader2Dao.findAll();

			ArrayList<Long> arra1 = new ArrayList<Long>();
			tra2Model.forEach(screens -> {
				arra1.add(screens.getId());

			});

			Long last = null;
			last = arra1.get(arra1.size() - 1);
			k = (int) (long) last; // for getting last index id of traheader2 table

			System.out.println(k);

			if (sect != "" && responsetype != "") {
				traheader2Model traheader2Model = new traheader2Model();
				traheader2Model.setTraheaderid(i);
				traheader2Model.setSection(sect);
				traheader2Model.setAnswertype(responsetype);
				traheader2Dao.save(traheader2Model);
				long l = traheader2Model.getId();
				tra2id = (int) l;
				traheader3Model traheader3Model = new traheader3Model();
				traheader3Model.setTra2id(tra2id);
				traheader3Model.setQuestion(question);
				traheader3Dao.save(traheader3Model);

			}

			// for save question and otherdetails
			else if (section != " " && answertype != " ") {
				traheader3Model traheader3Model = new traheader3Model();
				traheader3Model.setTra2id(k);
				traheader3Model.setQuestion(question);
				traheader3Dao.save(traheader3Model);

			}

		} catch (Exception e) {
			return "failed";
		}
		return "sucess";

	}

	/*
	 * @RequestMapping(value = "/ViewEvalform", method = RequestMethod.GET)//for
	 * training announcement public String ViewEvalform(@RequestParam(value =
	 * "traingid", required = false) Long traingid,Model model){
	 * if(!StringUtils.isEmpty(traingid)){ traheader1Model
	 * traModel=traheader1Dao.findById(traingid);
	 * model.addAttribute("Training",traModel); int i = (int) (long) traingid;
	 * 
	 * List<traheader2Model> trainingDetails=traheader2Dao.findAll(); // for getting
	 * details from traheader2 table
	 * 
	 * trainingDetails=trainingDetails.stream() // converting the list to stream
	 * .filter(str -> str.getTraheaderid()==(i)) // filter the stream to create a
	 * new stream
	 * 
	 * .collect(Collectors.toList()); // collect the final stream and convert it to
	 * a List
	 * 
	 * model.addAttribute("trainingDetails",trainingDetails);
	 * 
	 * List list1 = new ArrayList();
	 * 
	 * for (traheader2Model result : trainingDetails) { list1.add(result.getId()); }
	 * int z=0; List<traheader3Model> traheader3Model=traheader3Dao.findAll();
	 * for(int j=0;j<list1.size();j++) { z=(int) (long) list1.get(j);
	 * 
	 * }
	 * 
	 * } List<traheader1Model> traheader1Model=traheader1Dao.findAll();
	 * model.addAttribute("Traininglist",traheader1Model);
	 * 
	 * return "/ViewEvalform"; }
	 */

}
