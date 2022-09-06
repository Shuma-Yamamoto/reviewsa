# frozen_string_literal: true

require 'csv'

CSV.foreach('db/csv/tdfk.csv', headers: true) do |row|
  Prefecture.create!(
    name: row['name']
  )
end

CSV.foreach('db/csv/univ.csv', headers: true) do |row|
  University.create!(
    name: row['name'],
    faculty: row['faculty'],
    department: row['department'],
    domain: row['domain'],
    url: row['url']
  )
end

CSV.foreach('db/csv/high.csv', headers: true) do |row|
  HighSchool.create!(
    name: row['name'],
    score: row['score'],
    prefecture_id: row['prefecture_id']
  )
end

CSV.foreach('db/csv/subject.csv', headers: true) do |row|
  Subject.create!(
    name: row['name']
    )
end

CSV.foreach('db/csv/book.csv', headers: true) do |row|
  Book.create!(
    name: row['name'],
    price: row['price'],
    url: row['url']
  )
end
