module Ruboty
  module Github
    module Actions
      class Assign < Base
        def call
          if !has_access_token?
            require_access_token
          else
            assign
          end
        rescue Octokit::Unauthorized
          message.reply("Failed in authentication (401)")
        rescue Octokit::NotFound
          message.reply("Could not find that issue")
        rescue => exception
          message.reply("Failed by #{exception.class}")
          raise exception
        end

        private

        def assign
          client.update_issue(repository, issue_number, assignee: assignee)
          message.reply("Assign #{repository}##{issue_number} to #{assignee}")
        end

        def issue_number
          message[:number]
        end

        def assignee
          message[:assignee].strip
        end
      end
    end
  end
end
