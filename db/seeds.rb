seed_courses = [
  {
    course_name: 'Boat Texas',
    course_domain: 'Boat-ed',
    actor: 'Boater',
    active: true,
    closed: false,
    country_code: 'US',
    state_cd: 'TX',
    marketing_page: true
  },
  {
    course_name: 'Hunt Texas',
    course_domain: 'Hunter-ed',
    actor: 'Hunter',
    active: true,
    closed: false,
    country_code: 'US',
    state_cd: 'TX',
    marketing_page: true
  },
  {
    course_name: 'Boat Louisiana',
    course_domain: 'Boat-ed',
    actor: 'Boater',
    active: true,
    closed: false,
    country_code: 'US',
    state_cd: 'LA',
    marketing_page: true
  }
]

courses = Course.create(seed_courses)
course_ids = courses.map { |c| c.id }
course_registration_details = []

course_ids.each_with_index do |cid, index|
  next unless course_ids.count - 1 != index

  course_registration_detail_data = [
    {
      course_id: cid,
      name: 'gender',
      question: 'Gender',
      template: 'select',
      required: true,
      format: 'string',
      order: 0,
    },
    {
      course_id: cid,
      name: 'hair_color',
      question: 'Hair Color',
      template: 'select',
      required: true,
      format: 'string',
      order: 1,
    },
    {
      course_id: cid,
      name: 'eye_color',
      question: 'Eye Color',
      template: 'select',
      required: true,
      format: 'string',
      order: 2,
    },
  ]

  crds = CourseRegistrationDetail.create(course_registration_detail_data)
  course_registration_details = course_registration_details + crds
end

gender_values = ['Male', 'Female', 'Other']
color_values = ['Blonde', 'Brown', 'Black', 'Red', 'White/Grey', 'Other']

course_registration_detail_values = []

course_registration_details.each do |crdi|
  case crdi.name
  when 'gender'
    course_registration_detail_values_data = gender_values.map do |gv|
      {
        course_registration_detail_id: crdi.id,
        value: gv
      }
    end
  when 'hair_color'
    course_registration_detail_values_data = color_values.map do |gv|
      {
        course_registration_detail_id: crdi.id,
        value: gv
      }
    end
  end

  next if course_registration_detail_values_data.nil?

  crdvs = CourseRegistrationDetailValue.create(course_registration_detail_values_data)
  course_registration_detail_values = course_registration_detail_values + crdvs
end
