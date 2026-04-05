# Aliases
alias gpf "git remote prune origin; git fetch"

# Abbreviations
if command -q gh
    abbr --add issue gh issue
    abbr --add issues gh issue list
    abbr --add issuev gh issue view
    abbr --add issuee gh issue
    abbr --add pr gh pr
    abbr --add prs gh pr list
    abbr --add prv gh pr view
    abbr --add pre gh pr edit
    abbr --add prcr gh pr create
end

abbr --add gst git status
abbr --add glogn git log --graph --oneline -n
abbr --add gco git checkout
abbr --add grc git restore --staged
abbr --add gmm git commit -m
abbr --add ga git add
abbr --add gwta git worktree add
abbr --add gwtr git worktree remove
abbr --add gwtl git worktree list

# Functions
if command -q fzf
    function _git_worktree_path_for_branch
        set -l target_branch $argv[1]
        git worktree list --porcelain 2>/dev/null \
            | awk -v branch="refs/heads/$target_branch" '
                /^worktree / { path = $2 }
                $0 == "branch " branch { print path; exit }
            '
    end

    function gbp
        set -l selected (git branch --all 2>/dev/null | fzf)

        if test -z "$selected"
            return
        end

        if string match -rq '^\+' -- "$selected"
            set -l branch (string replace -r '^[+ ]+' '' -- "$selected")
            cd (_git_worktree_path_for_branch "$branch")
        else
            set -l branch (string replace -r '^[* ]+' '' -- "$selected")
            set branch (string replace -r '^remotes/[^/]+/' '' -- "$branch")
            git switch "$branch"
        end
    end
end
