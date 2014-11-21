class LeaderboardController < ApplicationController
     
     helper_method :generate_top_leaderboard, :generate_168_leaderboard
     
     def generate_top_leaderboard
          
          query = "SELECT users.username AS user_name, SUM(user_responses.award) AS award 
             FROM users JOIN user_responses 
             ON users.id = user_responses.user_id
             GROUP BY users.username 
             ORDER BY SUM(user_responses.award) DESC
             LIMIT 10"
     results = ActiveRecord::Base.connection.execute(query);
     end
     
     def generate_168_leaderboard
          
          query = "SELECT users.username AS user_name, SUM(user_responses.award) AS award
          FROM users JOIN user_responses
          ON users.id = user_responses.user_id
          WHERE user_responses.created_at > current_timestamp - interval '168 hours'
          GROUP BY users.username 
          ORDER BY SUM(user_responses.award) DESC
          LIMIT 10"
     results = ActiveRecord::Base.connection.execute(query);
     end
     
     def show_leaderboard
     render "leaderboard/leaderboard"
     end
end