class EdoOracle::ViewChecker

  VIEW_DEPENDENCIES = [
    {
      :id => 'SISEDO.API_COURSEIDENTIFIERSV00_VW',
      :columns => ['subjectArea']
    },
    {
      :id => 'SISEDO.API_COURSEV01_MVW',
      :columns => %w(catalogNumber-formatted catalogNumber-number catalogNumber-prefix catalogNumber-suffix cms-id classSubjectArea displayName status-code subjectArea transcriptTitle title)
    },
    {
      :id => 'SISEDO.API_COURSEV01_MVW',
      :columns => %w(cms-version-independent-id displayName subjectArea classSubjectArea catalogNumber-formatted catalogNumber-number catalogNumber-prefix catalogNumber-suffix title transcriptTitle updatedDate fromDate toDate)
    },
    {
      :id => 'SISEDO.ASSIGNEDINSTRUCTORV00_VW',
      :columns => %w(campus-uid cs-course-id familyName formattedName givenName gradeRosterAccess instructor-id number offeringNumber printInScheduleOfClasses role-code role-descr session-id term-id)
    },
    {
      :id => 'SISEDO.CLASSSECTIONALLV01_MVW',
      :columns => %w(component-code cs-course-id displayName endDate finalExam id maxEnroll maxWaitlist primary primaryAssociatedSectionId printInScheduleOfClasses sectionNumber status-code session-id startDate term-id)
    },
    {
      :id => 'SISEDO.CLASSSECTIONALLV01_MVW',
      :columns => %w(id cs-course-id offeringNumber term-id session-id sectionNumber number component-code component-descr displayName instructionMode-code instructionMode-descr startDate endDate status-code status-descr classEnrollmentType-code classEnrollmentType-descr updatedDate cancelDate primary primaryAssociatedComponent primaryAssociatedSectionId enrollmentStatus-code enrollmentStatus-descr enrolledCount waitlistedCount minEnroll maxEnroll maxWaitlist instructorAddConsentRequired instructorDropConsentRequired printInScheduleOfClasses graded feesExist roomShare optionalSection contactHours finalExam topic-id topic-descr)
    },
    {
      :id => 'SISEDO.CLC_ENROLLMENTV00_VW',
      :columns => %w(STUDENT_ID CAMPUS_UID ACAD_CAREER INSTITUTION STDNT_ENRL_STATUS_CODE WAITLISTPOSITION UNITS_TAKEN UNITS_EARNED GRADE_MARK GRADING_BASIS_CODE TERM_ID SESSION_ID CLASS_SECTION_ID GRADE_POINTS CRSE_CAREER RQMNT_DESIGNTN)
    },
    {
      :id => 'SISEDO.CLC_TERM_INSTR_BF2008V00_VW',
      :columns => %w(INSTRUCTOR_ID STRM)
    },
    {
      :id => 'SISEDO.DISPLAYNAMEXLATV01_MVW',
      :columns => %w(classDisplayName courseDisplayName)
    },
    {
      :id => 'SISEDO.DISPLAYNAMEXLATV01_MVW',
      :columns => %w(courseDisplayName classDisplayName)
    },
    {
      :id => 'SISEDO.EXTENDED_TERM_MVW',
      :columns => %w(STRM TERM_END_DT)
    },
    {
      :id => 'SISEDO.GRADING_DATES_CS_V00_VW',
      :columns => %w(ACAD_CAREER TERM_ID SESSION_CODE TERM_DESCR ACAD_CAREER_DESCR SESSION_DESCR MID_BEGIN_DT MID_END_DT FINAL_BEGIN_DT FINAL_END_DT)
    },
    {
      :id => 'SISEDO.MEETINGV00_VW',
      :columns => %w(cs-course-id endDate endTime location-descr meetsDays offeringNumber sectionNumber session-id startDate startTime term-id)
    },
    {
      :id => 'SISEDO.PERSON_EMAILV00_VW',
      :columns => %w(PERSON_KEY EMAIL_PRIMARY)
    },
    {
      :id => 'SISEDO.STUCAR_TERMV00_VW',
      :columns => %w(STUDENT_ID ACAD_CAREER INSTITUTION TERM_ID PNP_UNITS_TAKEN PNP_UNITS_PASSED PNP_TOT_UNITS_TAKEN PNP_TOT_UNITS_PASSED)
    },
    {
      :id => 'SISEDO.STUDENT_ACAD_STNDNGV00_VW',
      :columns => %w(STUDENT_ID ACADCAREER_CODE TERM_ID ACAD_STANDING_ACTION ACAD_STANDING_ACTION_DESCR OVERRIDE_MANUAL ACAD_PROGRAM ACAD_STANDING_STATUS ACAD_STANDING_STATUS_DESCR ACTION_DATE)
    },
    {
      :id => 'SISEDO.STUDENT_GROUPV01_VW',
      :columns => %w(STUDENT_ID STDNT_GROUP STDNT_GROUP_DESCR STDNT_GROUP_FROMDATE)
    },
    {
      :id => 'SISEDO.STUDENT_PLAN_CC_V00_VW',
      :columns => %w(STUDENT_ID ACADPLAN_CODE ACADPLAN_DESCR ACADPLAN_TYPE_CODE ACADPROG_CODE STATUSINPLAN_STATUS_CODE STATUSINPLAN_STATUS_DESCR STATUSINPLAN_ACTION_CODE STATUSINPLAN_ACTION_DESCR STATUSINPLAN_REASON_CODE STATUSINPLAN_REASON_DESCR ACADPLAN_FROMDATE)
    },
    {
      :id => 'SISEDO.STUDENT_REGISTRATIONV01_VW',
      :columns => %w(STUDENT_ID ACADCAREER_CODE TERM_ID WITHCNCL_TYPE_CODE WITHCNCL_TYPE_DESCR WITHCNCL_REASON_CODE WITHCNCL_REASON_DESCR WITHCNCL_FROMDATE WITHCNCL_LASTATTENDDATE)
    },
    {
      :id => 'SISEDO.STUDENT_TERM_CPPV00_VW',
      :columns => %w(TERM_ID INSTITUTION STUDENT_ID CAMPUS_ID ACAD_CAREER_CODE ACAD_CAREER_DESCR STUDENT_CAREER_NBR ACAD_PROGRAM ACAD_PROGRAM_DESCR ADMIT_TERM_ID EXP_GRAD_TERM_ID REQ_TERM_ID ACAD_PLAN ACAD_PLAN_TYPE ACAD_PLAN_DESCR ACAD_SUB_PLAN ACAD_SUBPLAN_DESCR DEGREE DEGREE_DESCR)
    },
  ]

  VIEW_DEPENDENCIES_CLC_SISEDO = [
    {
      :id => 'SISEDO.APPLICANT_ADMIT_DATAV00_VW',
      :columns => %w(STUDENT_ID ACADCAREER_CODE ACADCAREER_DESCR CAREER_NBR APPLICATION_NBR APPLICATION_PROG_NBR APPLICATION_CENTER ADMIT_TERM ADMIT_TERM_DESCR ADMIT_TYPE ADMIT_TYPE_DESCR PROG_STATUS PROG_STATUS_DESCR PROG_ACTION PROG_ACTION_DESCR ACAD_PROG ACAD_PROG_DESCR EVALUATION_CODE EVALUATION_NBR EVALUATOR_ID EVALUATOR_NAME EVALUATOR_EMAIL FINALIZED ATHLETE ADMITTED_GEP EXPIRE_DT_AD EXPIRE_DT_TC)
    },
    {
      :id => 'SISEDO.CLC_CURRENT_RESERVE_CAPACITYV00_VW',
      :columns => %w(TERM_ID SUBJECT CATALOG_NBR CLASS_SECTION COMPONENT CLASS_NBR RESERVED_SEATS RESERVED_SEATS_TAKEN REQUIREMENT_GROUP REQUIREMENT_GROUP_DESCR)
    },
    {
      :id => 'SISEDO.CLC_CONCURRENT_PROGRAMV00_VW',
      :columns => %w(STUDENT_ID INSTITUTION CONCURRENT_PROGRAM)
    },
    {
      :id => 'SISEDO.CLC_ENROLLMENT_LAWV00_VW',
      :columns => %w(STUDENT_ID CAMPUS_UID ACAD_CAREER INSTITUTION TERM_ID CLASS_NBR SEQ_NBR UNITS_TAKEN_LAW UNITS_EARNED_LAW LOCK_FLAG)
    },
    {
      :id => 'SISEDO.CLC_FA_AID_YEAR_V00_VW',
      :columns => %w(CAMPUS_ID STUDENT_ID INSTITUTION AID_YEAR AID_YEAR_DESCR DEFAULT_AID_YEAR AID_RECEIVED_FALL AID_RECEIVED_SPRING AID_RECEIVED_SUMMER)
    },
    {
      :id => 'SISEDO.CLC_FA_FASO_V00_VW',
      :columns => %w(STUDENT_ID CAMPUS_UID AID_YEAR UC_COST_ATTENDANCE UC_GIFT_AID_WAIVER UC_NET_COST UC_FUNDING_OFFERED UC_GIFT_AID_OUT UC_GRANTS_SCHOL UC_WAIVERS_OTH UC_FEE_WAIVERS UC_LOANS_WRK_STUDY UC_LOANS UC_WORK_STUDY)
    },
    {
      :id => 'SISEDO.CLC_FA_HOUSING_VW',
      :columns => %w(STUDENT_ID CAMPUS_UID TERM_DESCR TERM_ID HOUSING_OPTION HOUSING_STATUS HOUSING_BEGIN_DATE HOUSING_END_DATE AID_YEAR ACAD_CAREER NSLDS_LOAN_YEAR ACAD_PROG_PRIMARY ADMIT_TYPE ADMIT_TERM STUDENT_GROUPS_CODE)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_CATEGORIES_AID_YEAR',
      :columns => %w(STUDENT_ID INSTITUTION AID_YEAR SEQ_NUM TYPE_DESCRIPTION TYPE_MIN_AMOUNT TYPE_DURATION TYPE_INTEREST_RATE USE_NSLDS_INTEREST_RATE TYPE_DETAILS_VIEW_NAME)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_CUMULATIVE',
      :columns => %w(INSTITUTION SEQ_NUM CATEGORY_TITLE CATEGORY_TEXT CATEGORY_TEXT_PRE_2168 SEQ_NUM_TYPE TYPE_TITLE TYPE_MIN_AMOUNT TYPE_DURATION TYPE_INTEREST_RATE TYPE_DETAILS_VIEW_NAME)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_AY_GRADPLUS',
      :columns => %w(STUDENT_ID INSTITUTION AID_YEAR FA_SOURCE FA_SOURCE_DESCR LOAN_DESCR FEDERAL_ID LOAN_AMOUNT LOAN_INTEREST_RATE)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_AY_HPSL',
      :columns => %w(STUDENT_ID INSTITUTION AID_YEAR FA_SOURCE FA_SOURCE_DESCR LOAN_DESCR FEDERAL_ID LOAN_AMOUNT LOAN_INTEREST_RATE)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_AY_INST_STATE',
      :columns => %w(STUDENT_ID INSTITUTION AID_YEAR FA_SOURCE FA_SOURCE_DESCR LOAN_DESCR FEDERAL_ID LOAN_AMOUNT LOAN_INTEREST_RATE)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_AY_PERKINS',
      :columns => %w(STUDENT_ID INSTITUTION AID_YEAR FA_SOURCE FA_SOURCE_DESCR LOAN_DESCR FEDERAL_ID LOAN_AMOUNT LOAN_INTEREST_RATE)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_AY_PRIVATE',
      :columns => %w(STUDENT_ID INSTITUTION AID_YEAR FA_SOURCE FA_SOURCE_DESCR LOAN_DESCR FEDERAL_ID LOAN_AMOUNT LOAN_INTEREST_RATE)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_AY_SUB',
      :columns => %w(STUDENT_ID INSTITUTION AID_YEAR FA_SOURCE FA_SOURCE_DESCR LOAN_DESCR FEDERAL_ID LOAN_AMOUNT LOAN_INTEREST_RATE)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_AY_UNSUB',
      :columns => %w(STUDENT_ID INSTITUTION AID_YEAR FA_SOURCE FA_SOURCE_DESCR LOAN_DESCR FEDERAL_ID LOAN_AMOUNT LOAN_INTEREST_RATE)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_CUMUL_GRADPLUS',
      :columns => %w(STUDENT_ID LOAN_AMOUNT)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_CUMUL_HPSL',
      :columns => %w(STUDENT_ID LOAN_AMOUNT)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_CUMUL_INST_STATE',
      :columns => %w(STUDENT_ID LOAN_AMOUNT)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_CUMUL_PERKINS',
      :columns => %w(STUDENT_ID LOAN_AMOUNT)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_CUMUL_PRIVATE',
      :columns => %w(STUDENT_ID LOAN_AMOUNT)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_CUMUL_SUB',
      :columns => %w(STUDENT_ID LOAN_AMOUNT)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_DTL_CUMUL_UNSUB',
      :columns => %w(STUDENT_ID LOAN_AMOUNT)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_GLOSSARY_AID_YEAR',
      :columns => %w(INSTITUTION SEQ_NUM GLOSSARY_ITEM_CD GLOSSARY_TITLE GLOSSARY_TEXT)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_GLOSSARY_CUMULATIVE',
      :columns => %w(INSTITUTION SEQ_NUM GLOSSARY_ITEM_CD GLOSSARY_TITLE GLOSSARY_TEXT)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_IS_ACTIVE_VW',
      :columns => %w(STUDENT_ID IS_STUDENT_ACTIVE)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_MESSAGES',
      :columns => %w(INSTITUTION MESSAGE_TYPE_CD MESSAGE_TITLE MESSAGE_TEXT)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_RESOURCES',
      :columns => %w(INSTITUTION SEQ_NUM RESOURCE_URL RESOURCE_TITLE RESOURCE_TEXT RESOURCE_HOVER_OVER)
    },
    {
      :id => 'SISEDO.CLC_FA_LNHST_STD_ENRL_PRE_2168',
      :columns => %w(INSTITUTION STUDENT_ID ENRL_PRE_2168)
    },
    {
      :id => 'SISEDO.PS_UC_CLC_FA_TC_VW',
      :columns => %w(CAMPUS_ID STUDENT_ID INSTITUTION AID_YEAR APPROVED RESPONSE_DESCR MAIN_HEADER MAIN_BODY DYNAMIC_HEADER DYNAMIC_BODY)
    },
    {
      :id => 'SISEDO.CLC_FA_TITLE_IV_V00_VW',
      :columns => %w(CAMPUS_ID STUDENT_ID INSTITUTION APPROVED RESPONSE_DESCR MAIN_HEADER MAIN_BODY DYNAMIC_HEADER DYNAMIC_BODY DYNAMIC_LABEL CONTACT_TEXT)
    },
    {
      :id => 'SISEDO.CLC_FINAL_EXAM_INFOV00_VW',
      :columns => %w(EXAM_TIME_CODE EXAM_DT EXAM_START_TIME EXAM_END_TIME FACILITY_DESCR FINALIZED EXAM_EXCEPTION CRSE_ID CRSE_OFFER_NBR STRM SESSION_CODE CLASS_SECTION)
    },
    {
      :id => 'SISEDO.CLC_RQMNT_DESIG_DESCR',
      :columns => %w(INSTITUTION ACAD_CAREER TERM_ID RQMNT_DESIGNTN DESCRIPTION DESCRSHORT DESCRFORMAL)
    },
    {
      :id => 'SISEDO.CLC_STDNT_LOOKUP_V00_VW',
      :columns => %w(UC_PRF_MIDDLE_NM EMAIL_ADDR ACAD_PROG UC_SRCH_CRIT STUDENT_ID CAMPUS_ID LAST_NAME FIRST_NAME MIDDLE_NAME UC_PRF_FIRST_NM)
    },
    {
      :id => 'SISEDO.CLC_STUDENT_CAREER_LAWV00_VW',
      :columns => %w(STUDENT_ID CAMPUS_ID ACAD_CAREER INSTITUTION TOTAL_CUMULATIVE_UNITS_LAW TOTAL_TRANSFER_UNITS_LAW)
    },
    {
      :id => 'SISEDO.CLC_STUDENT_CAREER_TERM_LAWV00_VW',
      :columns => %w(STUDENT_ID CAMPUS_ID ACAD_CAREER INSTITUTION TERM_ID EARNED_UNITS_LAW ENROLLED_UNITS_LAW)
    },
    {
      :id => 'SISEDO.CLC_STUDENT_CAREER_TERMV00_VW',
      :columns => %w(STUDENT_ID CAMPUS_ID ACAD_CAREER INSTITUTION TERM_ID TOTAL_EARNED_UNITS TOTAL_ENROLLED_UNITS GRADING_COMPLETE)
    },
    {
      :id => 'SISEDO.CLC_STUDENT_CAREERV00_VW',
      :columns => %w(STUDENT_ID CAMPUS_ID ACAD_CAREER INSTITUTION PROGRAM_STATUS TOTAL_CUMULATIVE_UNITS TOTAL_TRANSFER_UNITS TRANSFER_CREDIT_UNITS_ADJUSTMENT TRANSFER_TEST_UNITS_AP TRANSFER_TEST_UNITS_IB TRANSFER_TEST_UNITS_ALEVEL)
    },
    {
      :id => 'SISEDO.CLC_TERMV00_VW',
      :columns => %w(INSTITUTION ACADCAREER_CODE TERM_ID TERM_TYPE TERM_YEAR TERM_CODE TERM_DESCR TERM_BEGIN_DT TERM_END_DT CLASS_BEGIN_DT CLASS_END_DT INSTRUCTION_END_DT GRADES_ENTERED_DT FINAL_EXAM_WK_BEGIN_DT END_DROP_ADD_DT IS_SUMMER)
    },
    {
      :id => 'SISEDO.CLC_TRANSFER_CREDIT_SCHLV00_VW',
      :columns => %w(STUDENT_ID CAMPUS_UID ACAD_CAREER INSTITUTION MODEL_NBR ARTICULATION_TERM SCHOOL_DESCR RQMNT_DESIGNTN_DESCRFORMAL UNITS_TRNSFR UNITS_TRNSFR_LAW TRF_GRADE_POINTS)
    }
  ]

  VIEW_DEPENDENCIES_CLC_CS = [
    {
      :id => 'SYSADM.UCC_FA_PRFL_CAR',
      :columns => %w(EMPLID CAMPUS_ID INSTITUTION AID_YEAR STRM DESCR DESCR2)
    },
    {
      :id => 'SYSADM.UCC_FA_PRFL_ENR',
      :columns => %w(EMPLID CAMPUS_ID INSTITUTION AID_YEAR STRM DESCR DESCR2 DESCR3)
    },
    {
      :id => 'SYSADM.PS_UCC_FA_PRFL_FAT',
      :columns => %w(EMPLID CAMPUS_ID INSTITUTION AID_YEAR DESCR DESCR2 DESCR3 DESCR4 DESCR5 DESCR6 DESCRFORMAL DESCR7 DESCR8 TITLE MESSAGE_TEXT_LONG)
    },
    {
      :id => 'SYSADM.UCC_FA_PRFL_ISR',
      :columns => %w(EMPLID CAMPUS_ID INSTITUTION AID_YEAR DESCR DESCR2 DESCR3 DESCR4)
    },
    {
      :id => 'SYSADM.UCC_FA_PRFL_LVL',
      :columns => %w(EMPLID CAMPUS_ID INSTITUTION AID_YEAR STRM DESCR DESCR2)
    },
    {
      :id => 'SYSADM.UCC_FA_PRFL_RES',
      :columns => %w(EMPLID CAMPUS_ID INSTITUTION AID_YEAR STRM DESCR DESCR100)
    }
  ]

  def initialize
    @report = {
      :successes => [],
      :errors => []
    }
    VIEW_DEPENDENCIES.concat VIEW_DEPENDENCIES_CLC_SISEDO
    VIEW_DEPENDENCIES.concat VIEW_DEPENDENCIES_CLC_CS
    if !Settings.features.legacy_caldap
      VIEW_DEPENDENCIES << {
        :id => 'SISEDO.CALCENTRAL_PERSON_INFO_VW',
        :columns => %w(LDAP_UID FIRST_NAME LAST_NAME EMAIL_ADDRESS STUDENT_ID AFFILIATIONS PERSON_TYPE)
      }
    end
  end

  def perform_checks
    VIEW_DEPENDENCIES.each do |view|
      check_view(view)
    end
    @report
  end

  def check_view(view)
    query_string = "SELECT #{to_query_columns(view[:columns])} FROM #{view[:id]} WHERE rownum=1"
    results = EdoOracle::Queries.query(query_string)
    log_result(:successes, "#{view[:id]} has no issues") if results
  rescue => e
    log_result(:errors, "Failure to query #{view[:id]} - #{e.to_s}")
  end

  def log_result(type, message)
    @report[type].push(message)
  end

  def to_query_columns(column_names_array)
    column_names_array.map {|column_name|
      "\"#{column_name}\""
    }.join(',')
  end
end
