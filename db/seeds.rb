# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


## To re-create and re-seed database (including test fixtures)
# bundle exec rake db:drop; bundle exec rake db:create; bundle exec rake db:migrate; bundle exec rake db:fixtures:load RAILS_ENV=development; bundle exec rake db:seed;

unless Rails.env == "test"



  # to_keep = [ "users", "schema_migrations"]
  # tables = [
  #     "answer_types",
  #     "question_answer_options",
  #     "answer_sessions",
  #     "answers",
  #     "answer_values",
  #     "questions",
  #     "answer_edges",
  #     "units",
  #     "question_help_messages",
  #     "answer_options",
  #     "question_types",
  #     "question_edges",
  #     "question_flows",
  #     "votes",
  #     "groups"
  # ]

  # tables.each do |table|
  #   ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
  #   ActiveRecord::Base.connection.execute("SELECT SETVAL('#{table}_id_seq', 100000000)")
  # end

  # files = [
  #     ["units.yml", Unit],
  #     ["groups.yml", Group],
  #     ["answer_types.yml", AnswerType],
  #     ["question_types.yml", QuestionType],
  #     ["answer_options.yml", AnswerOption],
  #     ["question_help_messages.yml", QuestionHelpMessage],
  #     ["questions.yml", Question],
  #     ["question_flows.yml", QuestionFlow],
  # ]

  # files.each do |file_name, model_class|
  #   file_path = Rails.root.join('lib', 'data', 'surveys', file_name)

  #   puts(file_path)

  #   yaml_data = YAML.load_file(file_path)

  #   yaml_data.each do |object_attrs|
  #     #MY_LOG.info object_attrs
  #     model_class.create(object_attrs)
  #   end
  # end

  # qe_path = Rails.root.join('lib', 'data', 'surveys', 'question_edges.yml')
  # puts(qe_path)

  # yaml_data = YAML.load_file(qe_path)

  # yaml_data.each_with_index do |attrs, i|

  #   q1 = Question.find(attrs['parent_question_id'])
  #   q2 = Question.find(attrs['child_question_id'])

  #   qe = QuestionEdge.build_edge(q1, q2, attrs['condition'], attrs['question_flow_id'])

  #   puts("Creating edge #{i} of #{yaml_data.length} between #{q1.id} and #{q2.id}")
  #   raise StandardError, qe.errors.full_messages unless qe.save
  # end

  # QuestionFlow.all.each {|qf| qf.reset_paths }

  if (user = User.find_by_email("seanahrens@gmail.com"))
    user.add_role :admin
    user.add_role :owner
  else
    user = User.create(email: "seanahrens@gmail.com", password: "12345678")
    user.add_role :admin
    user.add_role :owner
  end

  if (user = User.find_by_email("piotr.mankowski@gmail.com"))
    user.add_role :admin
    user.add_role :owner
  else
    user = User.create(email: "piotr.mankowski@gmail.com", password: "12345678")
    user.add_role :admin
    user.add_role :owner
  end


  # idea_titles = ["Does Remicade Exacerbate Acne?", "Do periodic time off Adderal improve ADHD symptoms?","Does using a Sleep Mask work?"]
  # idea descriptions = ["Tritani oporteat singulis eu vim. Ne pri odio ponderum vituperatoribus, ea reque regione urbanitas vim. Legere minimum vim an. Nemore graecis consectetuer ad qui, ut mei feugiat appareat. Fabulas molestie ullamcorper ut duo, id vis ipsum ridens utamur, et per laudem commune. Omittam reprimique consequuntur has et, movet civibus forensibus sed ex.",
  # "Noluisse tacimates interesset eu cum, consulatu imperdiet intellegebat cum ei, id nec erat cotidieque. Offendit eloquentiam ei nec. Perfecto petentium ad duo, ad nec minim scripta, id nam choro democritum disputationi. Cu his saepe prompta, idque soluta appellantur mel ex, diceret detracto sed no. Sit aeterno tibique mediocritatem te, te mea dico assentior, et soluta vocent sit.",
  # "Eos sint labores honestatis cu, nulla percipitur mei an. Ex sit quaestio ocurreret conceptam, soleat quidam eam eu. Mel no quodsi facilis, est et ferri primis ullamcorper, ius reque animal definitiones ne. Mei ei utinam graeci, facete placerat invenire pri ad.",
  # "Ad malis everti mel, soleat comprehensam sit at. Per in eripuit voluptaria. Vix quem tibique eu. Ius nisl corpora iudicabit eu, at iudico phaedrum usu. Ea unum omnium habemus ius, no mea graeci gubergren quaerendum. Nobis congue mentitum ad mea, vis vide verear oporteat cu, tota deleniti voluptatum id vim. At nam corpora splendide, eam saepe lobortis gubergren ex, vix ea novum consectetuer interpretaris."]

  # num_users = 10

  # i = 0;
  # num_users.times do |i|
  #   user = User.create(email: "seed.user.#{i}@gmail.com", password: "12345678",)
  #   role = [:patient,:patient,:patient,:patient,:patient,:patient,:patient,:patient,:patient,:patient,:patient, :researcher, :stakeholder, :stakeholder, :stakeholder].shuffle.first
  #   user.add_role role

  #   if [:false,:false,:true].shuffle.first
  #     Idea.create(:title => idea_titles.shuffle.first, :description => idea_descriptions.shuffle.first, :author => user)
  #   end

  #   random_idea = Idea.find(rand(1..num_users))
  #   user.follow(random_idea)
  # end








end
