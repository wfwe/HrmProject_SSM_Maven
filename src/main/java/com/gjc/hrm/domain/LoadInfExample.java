package com.gjc.hrm.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LoadInfExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected int offset;

    protected int limit;

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public LoadInfExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andLoadTitleIsNull() {
            addCriterion("load_title is null");
            return (Criteria) this;
        }

        public Criteria andLoadTitleIsNotNull() {
            addCriterion("load_title is not null");
            return (Criteria) this;
        }

        public Criteria andLoadTitleEqualTo(String value) {
            addCriterion("load_title =", value, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadTitleNotEqualTo(String value) {
            addCriterion("load_title <>", value, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadTitleGreaterThan(String value) {
            addCriterion("load_title >", value, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadTitleGreaterThanOrEqualTo(String value) {
            addCriterion("load_title >=", value, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadTitleLessThan(String value) {
            addCriterion("load_title <", value, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadTitleLessThanOrEqualTo(String value) {
            addCriterion("load_title <=", value, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadTitleLike(String value) {
            addCriterion("load_title like", value, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadTitleNotLike(String value) {
            addCriterion("load_title not like", value, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadTitleIn(List<String> values) {
            addCriterion("load_title in", values, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadTitleNotIn(List<String> values) {
            addCriterion("load_title not in", values, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadTitleBetween(String value1, String value2) {
            addCriterion("load_title between", value1, value2, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadTitleNotBetween(String value1, String value2) {
            addCriterion("load_title not between", value1, value2, "loadTitle");
            return (Criteria) this;
        }

        public Criteria andLoadNameIsNull() {
            addCriterion("load_name is null");
            return (Criteria) this;
        }

        public Criteria andLoadNameIsNotNull() {
            addCriterion("load_name is not null");
            return (Criteria) this;
        }

        public Criteria andLoadNameEqualTo(String value) {
            addCriterion("load_name =", value, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadNameNotEqualTo(String value) {
            addCriterion("load_name <>", value, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadNameGreaterThan(String value) {
            addCriterion("load_name >", value, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadNameGreaterThanOrEqualTo(String value) {
            addCriterion("load_name >=", value, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadNameLessThan(String value) {
            addCriterion("load_name <", value, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadNameLessThanOrEqualTo(String value) {
            addCriterion("load_name <=", value, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadNameLike(String value) {
            addCriterion("load_name like", value, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadNameNotLike(String value) {
            addCriterion("load_name not like", value, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadNameIn(List<String> values) {
            addCriterion("load_name in", values, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadNameNotIn(List<String> values) {
            addCriterion("load_name not in", values, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadNameBetween(String value1, String value2) {
            addCriterion("load_name between", value1, value2, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadNameNotBetween(String value1, String value2) {
            addCriterion("load_name not between", value1, value2, "loadName");
            return (Criteria) this;
        }

        public Criteria andLoadPathIsNull() {
            addCriterion("load_path is null");
            return (Criteria) this;
        }

        public Criteria andLoadPathIsNotNull() {
            addCriterion("load_path is not null");
            return (Criteria) this;
        }

        public Criteria andLoadPathEqualTo(String value) {
            addCriterion("load_path =", value, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadPathNotEqualTo(String value) {
            addCriterion("load_path <>", value, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadPathGreaterThan(String value) {
            addCriterion("load_path >", value, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadPathGreaterThanOrEqualTo(String value) {
            addCriterion("load_path >=", value, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadPathLessThan(String value) {
            addCriterion("load_path <", value, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadPathLessThanOrEqualTo(String value) {
            addCriterion("load_path <=", value, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadPathLike(String value) {
            addCriterion("load_path like", value, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadPathNotLike(String value) {
            addCriterion("load_path not like", value, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadPathIn(List<String> values) {
            addCriterion("load_path in", values, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadPathNotIn(List<String> values) {
            addCriterion("load_path not in", values, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadPathBetween(String value1, String value2) {
            addCriterion("load_path between", value1, value2, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadPathNotBetween(String value1, String value2) {
            addCriterion("load_path not between", value1, value2, "loadPath");
            return (Criteria) this;
        }

        public Criteria andLoadUserIsNull() {
            addCriterion("load_user is null");
            return (Criteria) this;
        }

        public Criteria andLoadUserIsNotNull() {
            addCriterion("load_user is not null");
            return (Criteria) this;
        }

        public Criteria andLoadUserEqualTo(Integer value) {
            addCriterion("load_user =", value, "loadUser");
            return (Criteria) this;
        }

        public Criteria andLoadUserNotEqualTo(Integer value) {
            addCriterion("load_user <>", value, "loadUser");
            return (Criteria) this;
        }

        public Criteria andLoadUserGreaterThan(Integer value) {
            addCriterion("load_user >", value, "loadUser");
            return (Criteria) this;
        }

        public Criteria andLoadUserGreaterThanOrEqualTo(Integer value) {
            addCriterion("load_user >=", value, "loadUser");
            return (Criteria) this;
        }

        public Criteria andLoadUserLessThan(Integer value) {
            addCriterion("load_user <", value, "loadUser");
            return (Criteria) this;
        }

        public Criteria andLoadUserLessThanOrEqualTo(Integer value) {
            addCriterion("load_user <=", value, "loadUser");
            return (Criteria) this;
        }

        public Criteria andLoadUserIn(List<Integer> values) {
            addCriterion("load_user in", values, "loadUser");
            return (Criteria) this;
        }

        public Criteria andLoadUserNotIn(List<Integer> values) {
            addCriterion("load_user not in", values, "loadUser");
            return (Criteria) this;
        }

        public Criteria andLoadUserBetween(Integer value1, Integer value2) {
            addCriterion("load_user between", value1, value2, "loadUser");
            return (Criteria) this;
        }

        public Criteria andLoadUserNotBetween(Integer value1, Integer value2) {
            addCriterion("load_user not between", value1, value2, "loadUser");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateIsNull() {
            addCriterion("load_createdate is null");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateIsNotNull() {
            addCriterion("load_createdate is not null");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateEqualTo(Date value) {
            addCriterion("load_createdate =", value, "loadCreatedate");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateNotEqualTo(Date value) {
            addCriterion("load_createdate <>", value, "loadCreatedate");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateGreaterThan(Date value) {
            addCriterion("load_createdate >", value, "loadCreatedate");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateGreaterThanOrEqualTo(Date value) {
            addCriterion("load_createdate >=", value, "loadCreatedate");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateLessThan(Date value) {
            addCriterion("load_createdate <", value, "loadCreatedate");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateLessThanOrEqualTo(Date value) {
            addCriterion("load_createdate <=", value, "loadCreatedate");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateIn(List<Date> values) {
            addCriterion("load_createdate in", values, "loadCreatedate");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateNotIn(List<Date> values) {
            addCriterion("load_createdate not in", values, "loadCreatedate");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateBetween(Date value1, Date value2) {
            addCriterion("load_createdate between", value1, value2, "loadCreatedate");
            return (Criteria) this;
        }

        public Criteria andLoadCreatedateNotBetween(Date value1, Date value2) {
            addCriterion("load_createdate not between", value1, value2, "loadCreatedate");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkIsNull() {
            addCriterion("load_remark is null");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkIsNotNull() {
            addCriterion("load_remark is not null");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkEqualTo(String value) {
            addCriterion("load_remark =", value, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkNotEqualTo(String value) {
            addCriterion("load_remark <>", value, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkGreaterThan(String value) {
            addCriterion("load_remark >", value, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("load_remark >=", value, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkLessThan(String value) {
            addCriterion("load_remark <", value, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkLessThanOrEqualTo(String value) {
            addCriterion("load_remark <=", value, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkLike(String value) {
            addCriterion("load_remark like", value, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkNotLike(String value) {
            addCriterion("load_remark not like", value, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkIn(List<String> values) {
            addCriterion("load_remark in", values, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkNotIn(List<String> values) {
            addCriterion("load_remark not in", values, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkBetween(String value1, String value2) {
            addCriterion("load_remark between", value1, value2, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andLoadRemarkNotBetween(String value1, String value2) {
            addCriterion("load_remark not between", value1, value2, "loadRemark");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserIsNull() {
            addCriterion("can_load_user is null");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserIsNotNull() {
            addCriterion("can_load_user is not null");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserEqualTo(Integer value) {
            addCriterion("can_load_user =", value, "canLoadUser");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserNotEqualTo(Integer value) {
            addCriterion("can_load_user <>", value, "canLoadUser");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserGreaterThan(Integer value) {
            addCriterion("can_load_user >", value, "canLoadUser");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserGreaterThanOrEqualTo(Integer value) {
            addCriterion("can_load_user >=", value, "canLoadUser");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserLessThan(Integer value) {
            addCriterion("can_load_user <", value, "canLoadUser");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserLessThanOrEqualTo(Integer value) {
            addCriterion("can_load_user <=", value, "canLoadUser");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserIn(List<Integer> values) {
            addCriterion("can_load_user in", values, "canLoadUser");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserNotIn(List<Integer> values) {
            addCriterion("can_load_user not in", values, "canLoadUser");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserBetween(Integer value1, Integer value2) {
            addCriterion("can_load_user between", value1, value2, "canLoadUser");
            return (Criteria) this;
        }

        public Criteria andCanLoadUserNotBetween(Integer value1, Integer value2) {
            addCriterion("can_load_user not between", value1, value2, "canLoadUser");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}