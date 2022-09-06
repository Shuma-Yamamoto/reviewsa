# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_03_060114) do
  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.text "url", null: false
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_books_on_subject_id"
  end

  create_table "cram_histories", force: :cascade do |t|
    t.date "join_at", null: false
    t.date "leave_at", null: false
    t.integer "university_student_id", null: false
    t.integer "cram_school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cram_school_id"], name: "index_cram_histories_on_cram_school_id"
    t.index ["university_student_id"], name: "index_cram_histories_on_university_student_id"
  end

  create_table "cram_schools", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_subjects", force: :cascade do |t|
    t.integer "university_student_id", null: false
    t.integer "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_exam_subjects_on_subject_id"
    t.index ["university_student_id"], name: "index_exam_subjects_on_university_student_id"
  end

  create_table "examinees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "grade", null: false
    t.index ["email"], name: "index_examinees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_examinees_on_reset_password_token", unique: true
  end

  create_table "favorite_books", force: :cascade do |t|
    t.integer "examinee_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_favorite_books_on_book_id"
    t.index ["examinee_id"], name: "index_favorite_books_on_examinee_id"
  end

  create_table "favorite_reviews", force: :cascade do |t|
    t.integer "examinee_id", null: false
    t.integer "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examinee_id"], name: "index_favorite_reviews_on_examinee_id"
    t.index ["review_id"], name: "index_favorite_reviews_on_review_id"
  end

  create_table "fix_books", force: :cascade do |t|
    t.text "detail", null: false
    t.integer "university_student_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_fix_books_on_book_id"
    t.index ["university_student_id"], name: "index_fix_books_on_university_student_id"
  end

  create_table "high_schools", force: :cascade do |t|
    t.string "name", null: false
    t.float "score"
    t.integer "prefecture_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_high_schools_on_prefecture_id"
  end

  create_table "mock_exams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "begin_about", null: false
    t.integer "begin_season", null: false
    t.integer "begin_month", null: false
    t.integer "finish_about", null: false
    t.integer "finish_season", null: false
    t.integer "finish_month", null: false
    t.float "beginning_score", null: false
    t.text "pro", null: false
    t.text "con", null: false
    t.text "recommended_person", null: false
    t.text "recommended_usage", null: false
    t.integer "evaluation", null: false
    t.integer "university_student_id", null: false
    t.integer "book_id", null: false
    t.integer "mock_exam_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["mock_exam_id"], name: "index_reviews_on_mock_exam_id"
    t.index ["university_student_id"], name: "index_reviews_on_university_student_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "name", null: false
    t.string "faculty", null: false
    t.string "department"
    t.string "domain", null: false
    t.text "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "university_students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "university_id", null: false
    t.integer "high_school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "entrance_at", null: false
    t.integer "ronin", null: false
    t.boolean "anonymous_high_school", null: false
    t.date "join_club_at"
    t.date "leave_club_at"
    t.integer "club_frequency"
    t.index ["email"], name: "index_university_students_on_email", unique: true
    t.index ["high_school_id"], name: "index_university_students_on_high_school_id"
    t.index ["reset_password_token"], name: "index_university_students_on_reset_password_token", unique: true
    t.index ["university_id"], name: "index_university_students_on_university_id"
  end

  add_foreign_key "books", "subjects"
  add_foreign_key "cram_histories", "cram_schools"
  add_foreign_key "cram_histories", "university_students"
  add_foreign_key "exam_subjects", "subjects"
  add_foreign_key "exam_subjects", "university_students"
  add_foreign_key "favorite_books", "books"
  add_foreign_key "favorite_books", "examinees"
  add_foreign_key "favorite_reviews", "examinees"
  add_foreign_key "favorite_reviews", "reviews"
  add_foreign_key "fix_books", "books"
  add_foreign_key "fix_books", "university_students"
  add_foreign_key "high_schools", "prefectures"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "mock_exams"
  add_foreign_key "reviews", "university_students"
  add_foreign_key "university_students", "high_schools"
  add_foreign_key "university_students", "universities"
end
