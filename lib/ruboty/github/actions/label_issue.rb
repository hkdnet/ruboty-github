module Ruboty
  module Github
    module Actions
      class LabelIssue < Base
        def call
          if !has_access_token?
            require_access_token
          else
            add_labels
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

        def add_labels
          client.add_labels_to_an_issue(repository, issue_number, labels)
          message.reply("Add label(s) [#{labels.join(', ')}]")
        end

        def issue_number
          message[:number]
        end

        def labels
          message[:labels].split(',').map(&:strip)
        end
      end
    end
  end
end
