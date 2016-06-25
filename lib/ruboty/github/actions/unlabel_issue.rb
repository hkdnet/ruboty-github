module Ruboty
  module Github
    module Actions
      class UnlabelIssue < Base
        def call
          if !has_access_token?
            require_access_token
          else
            remove_labels
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

        def remove_labels
          new_labels # memo before remove
          client.remove_all_labels(repository, issue_number)
          client.add_labels_to_an_issue(repository, issue_number, new_labels)
          message.reply("Remove labels and present labels are [#{new_labels.join(', ')}]")
        end

        def new_labels
          @new_labels ||= present_labels - removing_labels
        end

        def issue_number
          message[:number]
        end

        def removing_labels
          message[:labels].split(',').map(&:strip)
        end

        def present_labels
          @present_labels ||= client.labels_for_issue(repository, issue_number).map(&:name)
        end
      end
    end
  end
end
